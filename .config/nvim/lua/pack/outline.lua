vim.pack.add({
    'https://github.com/hedyhli/outline.nvim'
}, { confirm = false })

require("outline").setup({
  outline_window = {
    position = 'left',
  }
})

vim.keymap.set({ 'x', 'i', 'v', 'n' }, '<C-\\>', ':Outline<CR>', { desc = "Toggle Outline visibility" })

