vim.pack.add({
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/L3MON4D3/LuaSnip',
    'https://github.com/rafamadriz/friendly-snippets',
    'https://github.com/saghen/blink.cmp'
}, { confirm = false })

require('blink.cmp').setup({
    keymap = {
        preset = "super-tab",

        ['<Tab>'] = false,

        ['<S-Tab>'] = {
            function(cmp)
                if cmp.snippet_active() then
                    return cmp.accept()
                else
                    return cmp.select_and_accept()
                end
            end,
            'snippet_forward',
            'fallback'
        },
    },
    ghost_text = { enabled = true },
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

vim.lsp.enable('lua_ls')
vim.lsp.enable('html')
vim.lsp.enable('ts_ls')
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

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('my.lsp', {}),
    callback = function(ev)
        local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))

        -- Auto-format ("lint") on save.
        -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
        if not client:supports_method('textDocument/willSaveWaitUntil')
            and client:supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
                group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
                buffer = ev.buf,
                callback = function()
                    vim.lsp.buf.format({ bufnr = ev.buf, id = client.id, timeout_ms = 1000 })
                end,
            })
        end
    end,
})
