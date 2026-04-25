vim.pack.add{ "https://github.com/lewis6991/gitsigns.nvim" }

require('gitsigns').setup({
    current_line_blame = true,
    current_line_blame_opts = {
        virt_text_pos = 'right_align'
    },

    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, lhs, rhs, desc)
            vim.keymap.set(
                mode,
                lhs,
                rhs,
                { buffer = bufnr, desc = desc }
            )
        end

        map("n", "gtn", gs.next_hunk, "Next hunk")
        map("n", "gtp", gs.prev_hunk, "Prev hunk")
        map("n", "gtv", gs.preview_hunk, "Preview hunk")
        map("n", "gts", gs.stage_hunk, "Stage hunk")
        map("n", "gtr", gs.reset_hunk, "Reset hunk")
    end,
})

