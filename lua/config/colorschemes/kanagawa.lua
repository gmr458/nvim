local status_ok, kanagawa = pcall(require, "kanagawa")

if not status_ok then
    return
end

local colors = require("kanagawa.colors").setup()

local bg_alt = "#111116"

kanagawa.setup({
    undercurl = true,
    commentStyle = { italic = false, bold = false },
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
        goTSNamespace = { fg = colors.fujiWhite },
        javascriptTSConstructor = { fg = colors.crystalBlue },
        TSConditional = { fg = colors.oniViolet, italic = true },
        TSInclude = { fg = colors.surimiOrange, italic = true },
        TSKeyword = { fg = colors.oniViolet, italic = true },
        TSKeywordOperator = { fg = colors.oniViolet, italic = true },
        TSKeywordFunction = { fg = colors.oniViolet, italic = true },
        TSKeywordReturn = { fg = colors.oniViolet, italic = true },
        TSMethod = { fg = colors.crystalBlue, italic = true },
        TSTypeBuiltin = { italic = true },
        TreesitterContext = { bg = colors.sumiInk2 },
        TreesitterContextLineNumber = { bg = colors.sumiInk2 },

        -- Disable bold
        Conceal = { bold = false },
        CursorLineNr = { bold = false },
        MatchParen = { bold = false },
        ModeMsg = { bold = false },
        Title = { bold = false },
        Boolean = { bold = false },
        Bold = { bold = false },
        Todo = { bold = false },
        TSStringEscape = { bold = false },
        NvimTreeRootFolder = { bold = false },
        NvimTreeExecFile = { bold = false },
    },
})

local status_feline, feline = pcall(require, "feline")

if not status_feline then
    return
end

feline.setup({
    force_inactive = {
        filetypes = {
            "^NvimTree$",
            "^packer$",
            "^startify$",
            "^fugitive$",
            "^fugitiveblame$",
            "^qf$",
            "^help$",
            "^TelescopePrompt$",
            "^alpha$",
            "^lsp%-installer$",
            "^lspinfo$",
        },
        buftypes = {
            "^terminal$",
        },
        bufnames = {},
    },
    disable = { filetypes = { "^alpha$" } },
    theme = require("config.feline.themes.kanagawa").palette(),
    components = require("config.feline.themes.kanagawa").components(),
})

vim.cmd("colorscheme kanagawa")
