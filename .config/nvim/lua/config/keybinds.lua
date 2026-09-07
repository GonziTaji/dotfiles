vim.g.mapleader = " "

vim.keymap.set({ "n", "v" }, "<leader>pe", function() require 'mini.files'.open() end, { desc = "Open minifiles" })
vim.keymap.set({ "n", "v" }, "<leader>mc", function() require 'mini.files'.open(vim.api.nvim_buf_get_name(0), true) end,
    { desc = "Open minifiles in buffer's dir" })
vim.keymap.set({ "n", "v" }, "-", function() require 'mini.files'.open(vim.api.nvim_buf_get_name(0), true) end,
    { desc = "Open minifiles in buffer's dir" })

-- vim.keymap.set({"n", "v"}, "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })

vim.keymap.set("n", "<leader>/", ":nohlsearch<CR>", { desc = "Clear search highlights" })

-- Center screen while jumping
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

-- Move lines up/down
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Errors/diagnostic
vim.keymap.set("n", "<C-a>", '<cmd>lua vim.diagnostic.setloclist()<CR>',
    { noremap = true, silent = true, desc = "Show diagnostics in quickfix" })
vim.keymap.set("n", "<leader>.", '<cmd>lua vim.lsp.buf.code_action()<CR>',
    { noremap = true, silent = true, desc = "Show code actions" })

-- Utils
vim.keymap.set("n", "<space>x", ":.lua<CR>", { desc = "Execute current line" })
vim.keymap.set("v", "<space>x", ":lua<CR>", { desc = "Execute selection" })
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>", { desc = "Source current file" })

-- buffer manipulation
vim.keymap.set("n", "<leader>bd", ":bd<CR>", { desc = "Delete current buffer" })
vim.keymap.set("n", "<leader>bad", ":%bd<CR>", { desc = "Delete all buffers" })
vim.keymap.set('n', '<leader>bod', ':%bd|e#|bd#<CR>', { desc = 'Close all buffers except current' })
