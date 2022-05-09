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
        TelescopeBorder = {
            bg = default_colors.sumiInk0,
            fg = default_colors.sumiInk0,
        },
        TelescopeNormal = { bg = default_colors.sumiInk0 },
        TelescopePreviewBorder = {
            bg = default_colors.sumiInk0,
            fg = default_colors.sumiInk0,
        },
        TelescopePreviewNormal = { bg = default_colors.sumiInk0 },
        TelescopePreviewTitle = { bg = default_colors.sumiInk0 },
        TelescopePromptBorder = {
            bg = default_colors.sumiInk0,
            fg = default_colors.sumiInk0,
        },
        TelescopePromptNormal = {
            bg = default_colors.sumiInk0,
        },
        TelescopePromptTitle = {
            bg = default_colors.sumiInk0,
            fg = default_colors.fujiWhite,
        },
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
