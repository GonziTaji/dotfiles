return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function ()
        -- setup - intente usar "opts = {...}" pero no pescaba la config...
        require('telescope').setup({
            defaults = {
                -- initial_mode = "normal",
                mappings = {
                    i = {
                        -- show help
                        ["<C-h>"] = "which_key",
                        -- go to normal mode with ctrl + c 
                        ["<C-c>"] = { "<esc>", type = "command" },
                    },
                    n = {
                        -- show help
                        ["<C-h>"] = "which_key",
                        -- Exit ctrl + c 
                        ["<C-c>"] = "close",
                    }
                }
            }
        })

        -- keybinds
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf',builtin.find_files, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<leader>pg',builtin.live_grep, { desc = 'Telescope live grep' })
        vim.keymap.set('n', '<leader>pb',builtin.buffers, { desc = 'Telescope buffers' })
        vim.keymap.set('n', '<leader>ph',builtin.help_tags, { desc = 'Telescope help tags' })

    end
}
