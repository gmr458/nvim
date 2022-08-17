local catppuccin_loaded, catppuccin = pcall(require, "catppuccin")

if not catppuccin_loaded then
    print("catppuccin not loaded")
    return
end

vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha

local colors = require("catppuccin.palettes").get_palette()

catppuccin.setup({
    transparent_background = false,
    term_colors = true,
    compile = {
        enabled = true,
        path = vim.fn.stdpath("cache") .. "/catppuccin",
    },
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
    },
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = { "italic" },
        functions = {},
        keywords = { "italic" },
        strings = {},
        variables = {},
        numbers = {},
        booleans = { "italic" },
        properties = {},
        types = {},
        operators = {},
    },
    integrations = {
        treesitter = true,
        native_lsp = {
            enabled = true,
            virtual_text = {
                errors = {},
                hints = {},
                warnings = {},
                information = {},
            },
            underlines = {
                errors = { "undercurl" },
                hints = { "undercurl" },
                warnings = { "undercurl" },
                information = { "undercurl" },
            },
        },
        coc_nvim = false,
        lsp_trouble = true,
        cmp = true,
        lsp_saga = true,
        gitgutter = false,
        gitsigns = true,
        telescope = true,
        nvimtree = {
            enabled = true,
            show_root = false,
            transparent_panel = false,
        },
        dap = {
            enabled = false,
            enable_ui = false,
        },
        neotree = {
            enabled = false,
            show_root = false,
            transparent_panel = false,
        },
        which_key = false,
        indent_blankline = {
            enabled = true,
            colored_indent_levels = false,
        },
        dashboard = false,
        neogit = false,
        vim_sneak = false,
        fern = false,
        barbar = false,
        bufferline = true,
        markdown = false,
        lightspeed = false,
        leap = false,
        ts_rainbow = true,
        hop = true,
        notify = false,
        telekasten = false,
        symbols_outline = false,
        mini = false,
        aerial = false,
        vimwiki = false,
        beacon = false,
        navic = false,
        overseer = false,
    },
    color_overrides = {},
    highlight_overrides = {},
    custom_highlights = {
        NormalFloat = { bg = colors.base },

        StatusLine = { bg = colors.base },

        -- BufferLine
        BufferLineBufferSelected = { style = {} },
        BufferLineIndicatorVisible = { bg = colors.mantle },

        -- Treesitter
        TSNamespace = { style = {} },
        TSParameter = { style = {} },
        TSTypeBuiltin = { style = { "italic" } },
        TSKeywordOperator = { style = { "italic" } },

        -- TreesitterContext
        TreesitterContext = { bg = colors.surface0 },
        TreesitterContextLineNumber = { bg = colors.surface0 },

        -- Telescope
        TelescopeBorder = { bg = colors.crust, fg = colors.crust },
        TelescopeNormal = { bg = colors.crust },

        -- Telescope Preview
        TelescopePreviewBorder = { bg = colors.mantle, fg = colors.mantle },
        TelescopePreviewNormal = { bg = colors.mantle },
        TelescopePreviewTitle = { bg = colors.mantle, fg = colors.mantle },

        -- Telescope Prompt
        TelescopePromptBorder = { bg = colors.surface0, fg = colors.surface0 },
        TelescopePromptNormal = { bg = colors.surface0 },
        TelescopePromptTitle = { bg = colors.surface0, fg = colors.surface0 },

        -- Telescope Selection
        TelescopeSelection = { bg = colors.crust, fg = colors.green },
        TelescopeMultiSelection = { bg = colors.crust },

        -- ToggleTerm
        ToggleTerm1NormalFloat = { bg = colors.crust },
        ToggleTerm1FloatBorder = { bg = colors.crust, fg = colors.crust },

        -- LSP Saga
        LspFloatWinNormal = { bg = colors.base },
        LspSagaFinderSelection = { fg = colors.blue },

        -- Trouble
        TroubleCount = { bg = colors.base },
    },
})

vim.cmd([[colorscheme catppuccin]])
