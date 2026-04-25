vim.pack.add({
    'https://github.com/stevearc/oil.nvim',
})

require("oil").setup({
    columns = {
        "icon",
    },
    delete_to_trash = true,
    lsp_file_methods = {
        autosave_changes = "unmodified",
    },
    float = {
        padding = 2,
    }
})
