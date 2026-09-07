vim.pack.add({
    "https://github.com/stevearc/conform.nvim"
}, { confirm = false })

require("conform").setup({
    formatters_by_ft = {
        javascript = { "prettierd" },
        typescript = { "prettierd" },
        javascriptreact = { "prettierd" },
        typescriptreact = { "prettierd" },
        html = { "prettierd" },
        css = { "prettierd" },
        json = { "prettierd" },
        markdown = { "prettierd" },
        yaml = { "prettierd" },
    },
    format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
    },
})
