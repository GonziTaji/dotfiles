vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pe", vim.cmd.Ex)
vim.keymap.set("n", "<leader>/", ":nohlsearch<CR>", { desc = "Clear search highlights" })
vim.keymap.set("n", "Y", "y$", { desc = "Yank to end of line" })

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

-- Better indenting in visual mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Code completion (:help ins-completion
-- vim.keymap.set({ "i", "x", "r" }, "<C-x><C-o>")

-- Errors/diagnostic
vim.keymap.set("n", "<C-a>", '<cmd>lua vim.diagnostic.setloclist()<CR>',
  { noremap = true, silent = true, desc = "Show diagnostics in quickfix" })
vim.keymap.set("n", "<leader>.", '<cmd>lua vim.lsp.buf.code_action()<CR>',
  { noremap = true, silent = true, desc = "Show code actions" })

-- Utils
vim.keymap.set("n", "<space>x", ":.lua<CR>", { desc = "Execute current line" })
vim.keymap.set("v", "<space>x", ":lua<CR>", { desc = "Execute selection" })
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>", { desc = "Source current file" })

-- Terminal
vim.keymap.set("t", "<C-n>", [[<C-\><C-n>]], { noremap = true, silent = true })
