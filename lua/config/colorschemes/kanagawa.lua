local status_ok, kanagawa = pcall(require, "kanagawa")

if not status_ok then
    return
end

local colors = require("kanagawa.colors").setup()

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
        goTSNamespace = { fg = colors.fujiWhite },
        javascriptTSConstructor = { fg = colors.crystalBlue },
        NormalFloat = { link = "Normal" },
        NvimTreeGitIgnored = { fg = colors.fujiGray },
        NvimTreeNormal = { bg = colors.sumiInk0 },
        NvimTreeNormalNC = { link = "NvimTreeNormal" },
        NvimTreeWinSeparator = {
            bg = colors.sumiInk1,
            fg = colors.sumiInk1,
        },
        StatusLine = { bg = colors.sumiInk1 },
        TelescopeBorder = {
            bg = colors.sumiInk0,
            fg = colors.sumiInk0,
        },
        TelescopeNormal = { bg = colors.sumiInk0 },
        TelescopePreviewBorder = {
            bg = colors.sumiInk0,
            fg = colors.sumiInk0,
        },
        TelescopePreviewNormal = { bg = colors.sumiInk0 },
        TelescopePreviewTitle = { bg = colors.sumiInk0 },
        TelescopePromptBorder = {
            bg = colors.sumiInk0,
            fg = colors.sumiInk0,
        },
        TelescopePromptNormal = {
            bg = colors.sumiInk0,
        },
        TelescopePromptTitle = {
            bg = colors.sumiInk0,
            fg = colors.fujiWhite,
        },
        ToggleTerm1NormalFloat = {
            bg = colors.sumiInk0,
        },
        ToggleTerm1FloatBorder = {
            bg = colors.sumiInk0,
            fg = colors.sumiInk0,
        },
        TSConditional = { fg = colors.oniViolet, style = "italic" },
        TSInclude = { fg = colors.surimiOrange, style = "italic" },
        TSKeyword = { fg = colors.oniViolet, style = "italic" },
        TSKeywordFunction = { fg = colors.oniViolet, style = "italic" },
        TSKeywordReturn = { fg = colors.oniViolet, style = "italic" },
        TSMethod = { fg = colors.crystalBlue, style = "italic" },
        TSTypeBuiltin = { style = "italic" },
    },
})

vim.cmd("colorscheme kanagawa")
