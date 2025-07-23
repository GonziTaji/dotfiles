return {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    lazy = false,
    build = ":TSUpdate",
    opts = {
        ensure_installed = { "lua", "html", "javascript", "css", "go" },
        highlight = { enable = true },
        indent = { enable = true },  
    }
}
