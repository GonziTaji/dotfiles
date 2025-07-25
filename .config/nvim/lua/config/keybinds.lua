vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pe", vim.cmd.Ex)
vim.keymap.set("n", "<leader>/", ":nohlsearch<CR>", { desc = "Clear search highlights" })
vim.keymap.set("n", "Y", "y$", { desc = "Yank to end of line" })

-- Center screen while jumping
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })
vim.keymap.set("n", "<C-e>", "<C-e>+1", { desc = "Move down (follow movement)" })
vim.keymap.set("n", "<C-y>", "<C-y>-1", { desc = "Move up (follow movement)" })

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

-- Command-line completion
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"
vim.opt.wildignore:append({ "*.o", "*.obj", "*.pyc", "*.class", "*.jar" })

-- Errors/diagnostic
vim.keymap.set("n", "<C-a>", '<cmd>lua vim.diagnostic.setloclist()<CR>', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>.", '<cmd>lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true })

-- Utils
vim.keymap.set("n", "<space>x", ":.lua<CR>") -- execute current line
vim.keymap.set("v", "<space>x", ":lua<CR>") -- execute selection
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>") -- source current file

-- Directory listing
vim.g.netrw_liststyle = 3

