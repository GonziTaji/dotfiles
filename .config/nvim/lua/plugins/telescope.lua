return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
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

        -- utils
        function find_nvim_config_files()
            builtin.find_files({
                prompt_title = "Neovim config files",
                cwd = vim.fn.stdpath("config"),
            })
        end

        -- configuration info
        vim.keymap.set('n', '<leader>ph', builtin.help_tags, { desc = 'Telescope help tags' })
        vim.keymap.set('n', '<leader>pk', builtin.keymaps, { desc = 'Telescope keybinds' })
        vim.keymap.set('n', '<leader>nc', find_nvim_config_files, { desc = 'Show nvim config files' })
        -- workspace navigation
        vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<leader>pg', builtin.live_grep, { desc = 'Telescope live grep' })
        vim.keymap.set('n', '<leader>pb', builtin.buffers, { desc = 'Telescope buffers' })
        -- git 
        vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = 'Telescope git status' })
        vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = 'Telescope git commits' })
        vim.keymap.set('n', '<leader>gt', builtin.git_stash, { desc = 'Telescope git stashes' })
        vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = 'Telescope git branches' })
        vim.keymap.set('n', '<leader>gf', builtin.git_bcommits, { desc = 'Telescope git commits of current buffer' })

        -- custom
    end
}
