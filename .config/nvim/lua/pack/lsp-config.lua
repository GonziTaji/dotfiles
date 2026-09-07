vim.pack.add({
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/L3MON4D3/LuaSnip',
    'https://github.com/rafamadriz/friendly-snippets',
    'https://github.com/saghen/blink.cmp'
}, { confirm = false })

local blink = require 'blink.cmp'

blink.setup({
    keymap = {
        preset = "super-tab",
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
    completion = {
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 500,
        },
    },
})

require("luasnip.loaders.from_vscode").lazy_load()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.lsp.config('html', {
    capabilities = capabilities,
})

vim.lsp.config('cssls', {
    capabilities = capabilities,
})

vim.lsp.config('gopls', {
    capabilities = capabilities,
})
vim.lsp.enable('gopls')

vim.lsp.enable('lua_ls')
vim.lsp.enable('ts_ls')
vim.lsp.enable('html')
vim.lsp.enable('cssls')
vim.lsp.enable('css_variables')
vim.lsp.enable('tailwindcss')

vim.lsp.config('tailwindcss', {
    settings = {
        tailwindCSS = {
            classFunctions = { "cva", "cx" },
        }
    }
})

vim.keymap.set("n", "<space>lf", vim.lsp.buf.format, { desc = "vim.lsp.buf.format()" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "vim.lsp.buf.definition()" })
vim.keymap.set('i', '<C-space>', vim.lsp.completion.get, { desc = "vim.lsp.completion.get()" })


