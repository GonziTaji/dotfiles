-- Basic
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 8
vim.opt.confirm = true


-- Chars
vim.opt.list = true
vim.opt.listchars = {
    lead = "·",
    trail = "·",
    tab = "→ ",
    extends = "›",
    precedes = "‹",
    multispace = "·"
}

-- Indentation
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4

-- Visual
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "100"
vim.opt.showmatch = true
vim.opt.wrap = false
vim.lsp.document_color.enable(true, nil, { style = 'virtual' })

-- Command-line completion
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"
vim.opt.wildignore:append({ "*.o", "*.obj", "*.pyc", "*.class", "*.jar" })

-- Directory listing
vim.g.netrw_preview         = 1
vim.g.netrw_liststyle       = 3
vim.g.netrw_winsize         = 30

-- Diagnostics
-- vim.keymap.set('n', 'gK',
--     function()
--         local new_config = not vim.diagnostic.config().virtual_lines
--         vim.diagnostic.config({ virtual_lines = new_config })
--     end,
--     { desc = 'Toggle diagnostic virtual_lines' }
-- )

-- Misc

-- SQL by default uses <C-C> and I use that combination to go to normal mode very often
vim.g.ftplugin_sql_omni_key = '<C-S>'


-- vim.diagnostic.config({
--     virtual_text = true,
-- })

-- vim.api.nvim_create_autocmd("InsertEnter", {
--     desc = "Show diagnostics on InsertEnter",
--     pattern = "*",
--     callback = function()
--         vim.diagnostic.config({
--             virtual_lines = false
--         })
--     end,
-- })
--
-- vim.api.nvim_create_autocmd("InsertLeave", {
--     desc = "Show diagnostics on InsertLeave",
--     pattern = "*",
--     callback = function()
--         vim.diagnostic.config({
--             virtual_lines = true,
--         })
--     end,
-- })
