return {
  'hedyhli/outline.nvim',
  config = function()
    require("outline").setup({
      outline_window = {
        position = 'left',
      }
    })

    vim.keymap.set({ 'x', 'i', 'v', 'n' }, '<C-\\>', ':Outline<CR>', { desc = "Toggle Outline visibility" })
  end
}
