local autocmd = vim.api.nvim_create_autocmd

local function can_format()
    local bufnr = vim.api.nvim_get_current_buf()
    local clients = vim.lsp.get_clients({ bufnr = bufnr })

    if #clients > 0 then
        local client = clients[1]
        if client.attached_buffers and client.attached_buffers[bufnr] then
            if client.supports_method("textDocument/formatting") then
                return true
            end
        end
    end

    return false
end

local function format()
    local cwd = vim.fn.getcwd()
    -- glob doesn't match dotfiles when using *
    local matches = vim.fn.glob(cwd .. "/.prettier*") .. vim.fn.glob(cwd .. "/prettier*")

    if #matches > 0 then
        vim.notify("formatted with Prettier")
        vim.cmd("Prettier")
        return
    end

    if can_format() then
        vim.notify("formatted with LSP")
        vim.lsp.buf.format({ async = false })
        return
    end

    local excluded_filetypes = { "hyprlang", "gitcommit" }

    local bufnr = vim.api.nvim_get_current_buf()
    local ft = vim.bo[bufnr].filetype

    if vim.tbl_contains(excluded_filetypes, ft) then
        vim.notify("not formatted. file is an excluded filetype")
        return
    end

    vim.notify("formatting with motion")

    vim.cmd("normal! mx")
    vim.cmd("normal! ggVG==")
    vim.cmd("normal! `x")
end

autocmd("BufWritePre", {
    callback = format
})

autocmd("InsertLeavePre", {
    callback = format
})
