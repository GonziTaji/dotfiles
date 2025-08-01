vim.cmd("highlight clear")
vim.cmd("syntax reset")
vim.o.background = "dark"
vim.g.colors_name = "earthsong"

local set = vim.api.nvim_set_hl

local p = {
    name                 = "Earthsong",
    background           = "#292520",
    black                = "#121418",
    blue                 = "#1398B9",
    bright_black         = "#675F54",
    bright_blue          = "#5FDAFF",
    bright_cyan          = "#84F088",
    bright_green         = "#98E036",
    bright_purple        = "#FF9269",
    bright_red           = "#FF645A",
    bright_white         = "#F6F7EC",
    bright_yellow        = "#E0D561",
    cursor_color         = "#F6F7EC",
    cyan                 = "#509552",
    foreground           = "#E5C7A9",
    green                = "#85C54C",
    purple               = "#D0633D",
    red                  = "#C94234",
    selection_background = "#121418",
    white                = "#F6F7EC",
    yellow               = "#F5AE2E",
    selection_bg         = "#38342E",
    line_number_fg       = "#524a43",
    statusline_bg        = "#282421",
    cursorline_bg        = "#3e3933",
    comment_fg           = "#7a7267",
    preproc_fg           = "#a0988e",
    todo_fg              = "#a0988e",
    pmenu_bg             = "#282421",
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

--[[ Treesitter
set(0, "@function", { link = "Function" })
set(0, "@variable", { fg = p.fg })
set(0, "@string", { link = "String" })
set(0, "@keyword", { link = "Keyword" })
set(0, "@type", { link = "Type" })
set(0, "@comment", { link = "Comment" })
]]

-- Other
set(0, "MatchParen", { fg = p.red, underline = true })
set(0, "Pmenu", { fg = p.fg, bg = p.pmenu_bg })
set(0, "PmenuSel", { bg = p.green })
set(0, "Search", { underline = true })
set(0, "IncSearch", { bg = p.yellow, fg = p.fg })
