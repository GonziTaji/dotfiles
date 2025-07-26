vim.keymap.set("n", "<leader>tcN", "<cmd>Termcontrol new<CR>", { desc = "Create new Termcontrol terminal" })
vim.keymap.set("n", "<leader>tcn", "<cmd>Termcontrol next<CR>", { desc = "Show next Termcontrol terminal" })
vim.keymap.set("n", "<leader>tcp", "<cmd>Termcontrol previous<CR>", { desc = "Show previous Termcontrol terminal" })
vim.keymap.set("n", "<leader>tcc", "<cmd>Termcontrol close<CR>", { desc = "Close Termcontrol terminal window" })
vim.keymap.set("n", "<leader>tcf", "<cmd>Termcontrol first<CR>", { desc = "Show last Termcontrol terminal" })
vim.keymap.set("n", "<leader>tcf", "<cmd>Termcontrol last<CR>", { desc = "Show last Termcontrol terminal" })
vim.keymap.set("n", "<leader>tcl", "<cmd>Termcontrol list<CR>", { desc = "Show last Termcontrol terminal" })
vim.keymap.set("n", "<leader>tco", function()
    local count = vim.v.count
    local cmd = "Termcontrol open"
    if count ~= 0 then
        cmd = cmd .. " " .. count
    end
    vim.cmd(cmd)
end, { desc = "Open terminal (use count for terminal index)", silent = true })

local state = {
    window = -1,
    buffers = {},
    last_open_index = nil
}

--- @param t table
--- @return number the next empty index in a table. If all its indexes have a value, returns the largest index + 1
local get_next_empty_index = function(t)
    for i = 1, table.maxn(t) + 1 do
        if not t[i] then
            return i
        end
    end

    -- should never get here
    return 1
end

-- tests
assert(get_next_empty_index({ [2] = 0 }) == 1, "get_next_empty_index error")
assert(get_next_empty_index({ 3, 5, 1, 5 }) == 5, "get_next_empty_index error")
assert(get_next_empty_index({ 1, 2, [5] = 0 }) == 3, "get_next_empty_index error")


local window_config = {
    split = 'below',
    height = 7
}

--- @param bi number | nil the buffer index in the state
local open_handler = function(bi)
    -- exceptions - window open and same selection as current
    if vim.api.nvim_win_is_valid(state.window) and bi == state.last_open_index then
        return
    end

    if (bi == nil) then
        bi = get_next_empty_index(state.buffers)
    end

    -- buffer creation/selecton
    local buf = nil
    if state.buffers[bi] and vim.api.nvim_buf_is_valid(state.buffers[bi]) then
        buf = state.buffers[bi]
        state.last_open_index = bi
    else
        buf = vim.api.nvim_create_buf(false, true)
        table.insert(state.buffers, bi, buf)
        state.last_open_index = bi

        vim.notify("New terminal created in position " .. bi, vim.log.levels.INFO)
    end

    -- window creation/selection
    if not vim.api.nvim_win_is_valid(state.window) then
        state.window = vim.api.nvim_open_win(buf, true, window_config)
    else
        vim.api.nvim_win_set_buf(state.window, buf)
    end

    -- open terminal if it's not
    if vim.bo[state.buffers[bi]].buftype ~= "terminal" then
        vim.cmd.terminal()
        -- always do this?
        vim.cmd("startinsert")
    end
end

local close_handler = function()
    if vim.api.nvim_win_is_valid(state.window) then
        vim.api.nvim_win_hide(state.window)
        return
    end

    vim.notify("Nothing to close", vim.log.levels.WARN)
end

--- Gets the next or previous index with a no nil value. It traverses every index doing a circular cicle.
--- If there's no valid index, or the only valid index is the current index `ci`, it returns null
--- @param t table an index-based table
--- @param ci integer the current index from which to step
--- @param d "next" | "previous" the direction to step in
local step_to_valid_index = function(t, ci, d)
    local n = table.maxn(t)

    if n == 0 then
        return nil
    end

    for i = 1, n do
        local step = nil
        if d == "next" then
            step = ((ci - 1 + i) % n) + 1
        else
            step = ((ci - 1 - i + n) % n) + 1
        end

        if t[step] ~= nil then
            if ci == step then
                return nil
            end

            return step
        end
    end

    return nil
end

-- stepper tests
local r = nil
local ci = nil
local t = { [2] = 1, [5] = 2, [7] = 3 }

ci = 7
r = step_to_valid_index(t, ci, "next")
assert(r == 2, "ERROR: should get next index = " .. 2)

ci = 5
r = step_to_valid_index(t, ci, "next")
assert(r == 7, "ERROR: should get next index = " .. 7)

ci = 2
r = step_to_valid_index(t, ci, "next")
assert(r == 5, "ERROR: should get next index = " .. 5)

t = { [2] = 1 }
r = step_to_valid_index(t, ci, "next")
assert(r == nil, "ERROR: should get nil index")

t = {}
r = step_to_valid_index(t, ci, "previous")
assert(r == nil, "ERROR: should get nil index")

t = { [2] = 1, [5] = 2, [7] = 3 }
ci = 7
r = step_to_valid_index(t, ci, "previous")
assert(r == 5, "ERROR: should get previous index = " .. 5)

ci = 5
r = step_to_valid_index(t, ci, "previous")
assert(r == 2, "ERROR: should get previous index = " .. 2)

ci = 2
r = step_to_valid_index(t, ci, "previous")
assert(r == 7, "ERROR: should get previous index = " .. 7)

t = { [2] = 1 }
r = step_to_valid_index(t, ci, "previous")
assert(r == nil, "ERROR: should get nil index")

t = {}
r = step_to_valid_index(t, ci, "previous")
assert(r == nil, "ERROR: should get nil index")

--- @param d "next" | "previous" the direction to step in
local step_handler = function(d)
    local buffer_index = step_to_valid_index(state.buffers, state.last_open_index, d)
    if buffer_index == nil then
        open_handler(nil)
        return
    end

    -- paranoic validations
    if not state.buffers[buffer_index] then
        vim.notify("Something happened. Buffer in index " .. buffer_index .. " does not exist", vim.log.levels.ERROR)
        return
    end

    if not vim.api.nvim_buf_is_valid(state.buffers[buffer_index]) then
        vim.notify("Something happened. Buffer in index " .. buffer_index .. " is not a valid buffer",
            vim.log.levels.ERROR)
        return
    end

    open_handler(buffer_index)
end

local list_handler = function()
    -- TODO:
    print(vim.inspect(state.buffers))
end

vim.api.nvim_create_user_command("Termcontrol", function(opts)
    local str_args = opts.args or ''
    local args = vim.split(str_args, " ")
    local action = args[1]

    if action == "close" then
        close_handler()
    elseif action == "open" then
        open_handler(tonumber(args[2]))
    elseif args[2] == "new" then
        open_handler(get_next_empty_index(state.buffers))
    elseif action == "first" then
        open_handler(step_to_valid_index(state.buffers, 0, "next"))
    elseif action == "last" then
        open_handler(table.maxn(state.buffers))
    elseif action == "previous" then
        step_handler("previous")
    elseif action == "next" then
        step_handler("next")
    elseif action == "list" then
        list_handler()
    end
end, {
    nargs = "+",
    complete = function(_, line)
        local commands = { "open", "new", "close", "previous", "next", "first", "last", "list" }
        local parts = vim.split(line, "%s+")
        local n = #parts - 2

        if n == 0 then
            return vim.tbl_filter(function(val)
                return vim.startswith(val, parts[2])
            end, commands)
        end

        return {}
    end
})
