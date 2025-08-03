return {
    "neanias/everforest-nvim",
    priority = 1000,
    config = function ()
        require("everforest").setup({
            background = "high",
            ---How much of the background should be transparent. 2 will have more UI
            ---components be transparent (e.g. status line background)
            transparent_background_level = 2,
            ---Whether italics should be used for keywords and more.
            italics = true,
            ---The contrast of line numbers, indent lines, etc. Options are `"high"` or
            ---`"low"` (default).
            ui_contrast = "high",
        })
    end
}
