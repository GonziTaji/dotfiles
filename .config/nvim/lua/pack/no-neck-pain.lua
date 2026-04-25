vim.pack.add({
    'https://github.com/shortcuts/no-neck-pain.nvim'
}, { confirm = false })

require('no-neck-pain').setup({
    width = 140,
    mappings = {
        enabled = true,
    },
    autocmds = {
        enableOnVimEnter = true,
        enableOnTabEnter = true,
        reloadOnColorSchemeChange = true,
        skipEnteringNoNeckPainBuffer = true,
    }
})

vim.keymap.set({ 'n', 'i', 'x', 'v' }, '<M-=>', function() vim.cmd(':NoNeckPainWidthUp') end,
{ desc = 'Increases the config width by 5 and resizes the no-neck-pain windows' })
vim.keymap.set({ 'n', 'i', 'x', 'v' }, '<M-->', function() vim.cmd(':NoNeckPainWidthDown') end,
{ desc = 'Decreases the config width by 5 and resizes the no-neck-pain windows' })
