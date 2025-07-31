vim.cmd("highlight clear")
vim.cmd("syntax reset")
vim.o.background = "dark"
vim.g.colors_name = "earthsong"

local set = vim.api.nvim_set_hl

local p = {
    black          = "#121418",
    red            = "#c94234",
    green          = "#85c54c",
    yellow         = "#f5ae2e",
    blue           = "#1398b9",
    magenta        = "#d0633d",
    cyan           = "#509552",
    white          = "#e5c6aa",
    bright_black   = "#675f54",
    bright_red     = "#ff645a",
    bright_green   = "#98e036",
    bright_yellow  = "#e0d561",
    bright_blue    = "#5fdaff",
    bright_magenta = "#ff9269",
    bright_cyan    = "#84f088",
    bright_white   = "#f6f7ec",
    bg             = "#292520",
    fg             = "#e5c7a9",
    cursor         = "#f6f7ec",
    line_number_fg = "#524a43",
    statusline_bg  = "#282421",
    cursorline_bg  = "#3e3933",
    comment_fg     = "#7a7267",
    preproc_fg     = "#a0988e",
    todo_fg        = "#a0988e",
    pmenu_bg       = "#282421",
}

-- UI
set(0, "Normal", { fg = p.fg, bg = p.bg })
set(0, "Cursor", { fg = p.bg, bg = p.cursor })
set(0, "Visual", { bg = p.bright_black })
set(0, "CursorLine", { bg = p.cursorline_bg })
set(0, "CursorLineNr", { fg = p.bright_black })
set(0, "LineNr", { fg = p.line_number_fg })
set(0, "StatusLine", { fg = p.white, bg = p.statusline_bg })
set(0, "VertSplit", { fg = p.line_number_fg, bg = p.line_number_fg })

-- Syntax
set(0, "Comment", { fg = p.comment_fg, italic = true })
set(0, "Constant", { fg = p.bright_yellow })
set(0, "String", { fg = p.yellow })
set(0, "Identifier", { fg = p.fg })
set(0, "Function", { fg = p.green })
set(0, "Statement", { fg = p.red })
set(0, "Keyword", { fg = p.green })
set(0, "PreProc", { fg = p.preproc_fg })
set(0, "Type", { fg = p.green })
set(0, "Special", { fg = p.white })
set(0, "Underlined", { underline = true })
set(0, "Todo", { fg = p.todo_fg, bold = true, reverse = true })

-- Diff
set(0, "DiffAdd", { bg = p.bright_green, fg = p.bright_black })
set(0, "DiffDelete", { bg = p.red, fg = p.bright_black })
set(0, "DiffChange", { bg = p.yellow, fg = p.bright_black })
set(0, "DiffText", { bg = p.yellow, fg = p.bright_black, bold = true })

-- Treesitter
set(0, "@function", { link = "Function" })
set(0, "@variable", { fg = p.fg })
set(0, "@string", { link = "String" })
set(0, "@keyword", { link = "Keyword" })
set(0, "@type", { link = "Type" })
set(0, "@comment", { link = "Comment" })

-- Other
set(0, "MatchParen", { fg = p.red, underline = true })
set(0, "Pmenu", { fg = p.fg, bg = p.pmenu_bg })
set(0, "PmenuSel", { bg = p.green })
set(0, "Search", { underline = true })
set(0, "IncSearch", { bg = p.yellow, fg = p.fg })
