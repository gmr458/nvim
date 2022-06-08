local status_ok, kanagawa = pcall(require, "kanagawa")

if not status_ok then
    return
end

local colors = require("kanagawa.colors").setup()

local bg_alt = "#111116"

kanagawa.setup({
    undercurl = true,
    commentStyle = "NONE",
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
        -- Float
        FloatBorder = { bg = bg_alt, fg = bg_alt },
        NormalFloat = { bg = bg_alt },

        -- StatusLine
        StatusLine = { bg = colors.sumiInk1 },

        -- NvimTree
        NvimTreeGitIgnored = { fg = colors.fujiGray },
        NvimTreeNormal = { bg = colors.sumiInk0 },
        NvimTreeNormalNC = { link = "NvimTreeNormal" },
        NvimTreeWinSeparator = { bg = colors.sumiInk1, fg = colors.sumiInk1 },

        -- Telescope
        TelescopeBorder = { bg = colors.sumiInk0, fg = colors.sumiInk0 },
        TelescopeNormal = { bg = colors.sumiInk0 },
        TelescopePreviewBorder = { bg = colors.sumiInk0, fg = colors.sumiInk0 },
        TelescopePreviewNormal = { bg = colors.sumiInk0 },
        TelescopePreviewTitle = { bg = colors.sumiInk0, fg = colors.fujiWhite },
        TelescopePromptBorder = { bg = colors.sumiInk0, fg = colors.sumiInk0 },
        TelescopePromptNormal = { bg = colors.sumiInk0 },
        TelescopePromptTitle = { bg = colors.sumiInk0, fg = colors.fujiWhite },
        TelescopeResultsTitle = { bg = colors.sumiInk0, fg = colors.fujiWhite },
        TelescopeSelection = { bg = colors.crust, fg = colors.springGreen },
        TelescopeMultiSelection = { bg = colors.sumiInk0 },

        -- ToggleTerm
        ToggleTerm1NormalFloat = { bg = bg_alt },
        ToggleTerm1FloatBorder = { bg = bg_alt, fg = bg_alt },

        -- Treesitter
        goTSNamespace = { fg = colors.fujiWhite },
        javascriptTSConstructor = { fg = colors.crystalBlue },
        TSConditional = { fg = colors.oniViolet, style = "italic" },
        TSInclude = { fg = colors.surimiOrange, style = "italic" },
        TSKeyword = { fg = colors.oniViolet, style = "italic" },
        TSKeywordFunction = { fg = colors.oniViolet, style = "italic" },
        TSKeywordReturn = { fg = colors.oniViolet, style = "italic" },
        TSMethod = { fg = colors.crystalBlue, style = "italic" },
        TSTypeBuiltin = { style = "italic" },
        TreesitterContext = { bg = colors.sumiInk2 },
        TreesitterContextLineNumber = { bg = colors.sumiInk2 },

        -- Disable bold
        Conceal = { style = "NONE" },
        CursorLineNr = { style = "NONE" },
        MatchParen = { style = "NONE" },
        ModeMsg = { style = "NONE" },
        Title = { style = "NONE" },
        Boolean = { style = "NONE" },
        Bold = { style = "NONE" },
        Todo = { style = "NONE" },
        TSKeywordOperator = { style = "NONE" },
        TSStringEscape = { style = "NONE" },
        NvimTreeRootFolder = { style = "NONE" },
        NvimTreeExecFile = { style = "NONE" },
    },
})

vim.cmd("colorscheme kanagawa")
