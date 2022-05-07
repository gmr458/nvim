local status_ok, kanagawa = pcall(require, "kanagawa")

if not status_ok then
    return
end

local default_colors = require("kanagawa.colors").setup()

kanagawa.setup({
    undercurl = true,
    commentStyle = "italic",
    functionStyle = "NONE",
    keywordStyle = "NONE",
    statementStyle = "NONE",
    typeStyle = "NONE",
    variablebuiltinStyle = "NONE",
    specialReturn = false,
    specialException = true,
    transparent = false,
    dimInactive = false,
    globalStatus = true,
    colors = {},
    overrides = {
        FloatBorder = { link = "Normal" },
        goTSNamespace = { fg = default_colors.fujiWhite },
        javascriptTSConstructor = { fg = default_colors.crystalBlue },
        NormalFloat = { link = "Normal" },
        NvimTreeGitIgnored = { fg = default_colors.fujiGray },
        NvimTreeNormal = { bg = default_colors.sumiInk0 },
        NvimTreeNormalNC = { link = "NvimTreeNormal" },
        NvimTreeWinSeparator = {
            bg = default_colors.sumiInk1,
            fg = default_colors.sumiInk1,
        },
        StatusLine = { bg = default_colors.sumiInk1 },
        TSConditional = { fg = default_colors.oniViolet, style = "italic" },
        TSInclude = { fg = default_colors.surimiOrange, style = "italic" },
        TSKeyword = { fg = default_colors.oniViolet, style = "italic" },
        TSKeywordFunction = { fg = default_colors.oniViolet, style = "italic" },
        TSKeywordReturn = { fg = default_colors.oniViolet, style = "italic" },
        TSMethod = { fg = default_colors.crystalBlue, style = "italic" },
        TSTypeBuiltin = { style = "italic" },
    },
})

vim.cmd("colorscheme kanagawa")
