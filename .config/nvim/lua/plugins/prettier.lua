return {
    "prettier/vim-prettier",
    config = function ()
        vim.keymap.set("n", "<leader>fo", ":PrettierAsync<CR>", { desc = "Format document" })

        vim.api.nvim_create_autocmd('BufWritePre', {
            callback = function(args)
                vim.cmd("Prettier")
            end
        })
    end
}
