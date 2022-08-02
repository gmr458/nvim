local kanagawa_loaded, kanagawa = pcall(require, "kanagawa")

if kanagawa_loaded == false then
    print("kanagawa not loaded")
    return
end

local colors = require("kanagawa.colors").setup()

local bg_alt = "#111116"

kanagawa.setup({
    undercurl = true,
    commentStyle = { italic = true, bold = false },
    functionStyle = { italic = false, bold = false },
    keywordStyle = { italic = false, bold = false },
    statementStyle = { italic = false, bold = false },
    typeStyle = { italic = false, bold = false },
    variablebuiltinStyle = { italic = false, bold = false },
    specialReturn = false,
    specialException = false,
    transparent = false,
    dimInactive = false,
    globalStatus = true,
    terminalColors = true,
    colors = {},
    overrides = {
        -- Float
        FloatBorder = { bg = bg_alt, fg = bg_alt },
        NormalFloat = { bg = bg_alt },

        -- BufferLine
        BufferLineFill = { bg = bg_alt },

        -- StatusLine
        StatusLine = { bg = colors.sumiInk1 },

        -- NvimTree
        NvimTreeGitIgnored = { fg = colors.fujiGray },
        NvimTreeNormal = { bg = colors.sumiInk0 },
        NvimTreeNormalNC = { link = "NvimTreeNormal" },
        NvimTreeWinSeparator = { bg = colors.sumiInk1, fg = colors.sumiInk1 },

        -- Telescope
        TelescopeBorder = { bg = bg_alt, fg = bg_alt },
        TelescopeNormal = { bg = bg_alt },
        TelescopePreviewBorder = { bg = bg_alt, fg = bg_alt },
        TelescopePreviewNormal = { bg = bg_alt },
        TelescopePreviewTitle = { bg = bg_alt, fg = colors.fujiWhite },
        TelescopePromptBorder = { bg = bg_alt, fg = bg_alt },
        TelescopePromptNormal = { bg = bg_alt },
        TelescopePromptTitle = { bg = bg_alt, fg = colors.fujiWhite },
        TelescopeResultsTitle = { bg = bg_alt, fg = colors.fujiWhite },
        TelescopeSelection = { bg = colors.crust, fg = colors.springGreen },
        TelescopeMultiSelection = { bg = bg_alt },

        -- ToggleTerm
        ToggleTerm1NormalFloat = { bg = bg_alt },
        ToggleTerm1FloatBorder = { bg = bg_alt, fg = bg_alt },

        -- Packer
        packerSuccess = { bg = bg_alt },

        -- Treesitter
        TSNamespace = { fg = colors.fujiWhite },
        javascriptTSConstructor = { fg = colors.crystalBlue },
        -- TSConditional = { fg = colors.oniViolet, italic = true },
        -- TSInclude = { fg = colors.surimiOrange, italic = true },
        -- TSKeyword = { fg = colors.oniViolet, italic = true },
        -- TSKeywordOperator = {
        --     fg = colors.oniViolet,
        --     italic = true,
        --     bold = false,
        -- },
        -- TSKeywordFunction = { fg = colors.oniViolet, italic = true },
        -- TSKeywordReturn = { fg = colors.oniViolet, italic = true },
        -- TSMethod = { fg = colors.crystalBlue, italic = true },
        -- TSTypeBuiltin = { fg = colors.waveAqua2, italic = true },
        TreesitterContext = { bg = colors.sumiInk2 },
        TreesitterContextLineNumber = { bg = colors.sumiInk2 },

        -- Trouble
        TroubleCount = { bg = colors.sumiInk1 },

        -- Disable bold
        -- Conceal = { bold = false },
        -- CursorLineNr = { bold = false },
        -- MatchParen = { bold = false },
        -- ModeMsg = { bold = false },
        -- Title = { bold = false },
        -- Boolean = { bold = false },
        -- Bold = { bold = false },
        -- Todo = { bold = false },
        -- TSStringEscape = { bold = false },
        -- NvimTreeRootFolder = { bold = false },
        -- NvimTreeExecFile = { bold = false },
    },
})

vim.cmd("colorscheme kanagawa")
