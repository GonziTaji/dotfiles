-- Basic
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 8

-- Chars
vim.opt.listchars = {
    lead = "·",
    tail = "·",
    -- multispace = "·",
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

-- Diagnostics
vim.keymap.set('n', 'gK',
    function()
      local new_config = not vim.diagnostic.config().virtual_lines
      vim.diagnostic.config({ virtual_lines = new_config })
    end,
    { desc = 'Toggle diagnostic virtual_lines' }
)

vim.diagnostic.config({
    virtual_text = true,
})

vim.api.nvim_create_autocmd("InsertEnter", {
    desc = "Show diagnostics on InsertEnter",
    pattern = "*",
    callback = function()
        vim.diagnostic.config({
            virtual_text = false
        })
    end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
    desc = "Show diagnostics on InsertLeave",
    pattern = "*",
    callback = function()
        vim.diagnostic.config({
            virtual_text = true,
        })
    end,
})
