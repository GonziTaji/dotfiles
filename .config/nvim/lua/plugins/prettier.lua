return {
    "prettier/vim-prettier",
    config = function()
        vim.keymap.set("n", "<leader>fo", ":PrettierAsync<CR>", { desc = "Format document" })
    end
}
