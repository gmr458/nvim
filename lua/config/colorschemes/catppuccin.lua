local catppuccin_loaded, catppuccin = pcall(require, "catppuccin")

if catppuccin_loaded == false then
    print("catppuccin not loaded")
    return
end

local colors = require("catppuccin.api.colors").get_colors()

catppuccin.setup({
    -- dim_inactive = false,
    transparent_background = false,
    term_colors = false,
    styles = {
        comments = "italic",
        conditionals = "NONE",
        loops = "NONE",
        functions = "NONE",
        keywords = "NONE",
        strings = "NONE",
        variables = "NONE",
        numbers = "NONE",
        booleans = "NONE",
        properties = "NONE",
        types = "NONE",
        operators = "NONE",
    },
    integrations = {
        treesitter = true,
        native_lsp = {
            enabled = true,
            virtual_text = {
                errors = "NONE",
                hints = "NONE",
                warnings = "NONE",
                information = "NONE",
            },
            underlines = {
                errors = "undercurl",
                hints = "undercurl",
                warnings = "undercurl",
                information = "undercurl",
            },
        },
        coc_nvim = false,
        lsp_trouble = true,
        cmp = true,
        lsp_saga = false,
        gitgutter = false,
        gitsigns = true,
        telescope = true,
        nvimtree = {
            enabled = true,
            show_root = false,
            transparent_panel = false,
        },
        neotree = {
            enabled = false,
            show_root = false,
            transparent_panel = false,
        },
        which_key = false,
        indent_blankline = {
            enabled = true,
            colored_indent_levels = true,
        },
        dashboard = false,
        neogit = false,
        vim_sneak = false,
        fern = false,
        barbar = false,
        bufferline = true,
        markdown = false,
        lightspeed = false,
        ts_rainbow = true,
        hop = true,
        notify = false,
        telekasten = false,
        symbols_outline = true,
        mini = false,
    },
    custom_highlights = {
        -- BufferLine
        BufferLineBufferSelected = { style = "italic" },
        BufferLineCloseButton = { bg = "#161622" },
        BufferLineIndicatorVisible = { bg = colors.mantle },
        BufferLineFill = { bg = colors.crust },

        -- Float
        FloatBorder = { bg = colors.crust, fg = colors.crust },
        NormalFloat = { bg = colors.crust },

        -- StatusLine
        StatusLine = { bg = colors.base },

        -- Telescope
        TelescopeBorder = { bg = colors.crust, fg = colors.crust },
        TelescopeNormal = { bg = colors.crust },
        TelescopePreviewBorder = { bg = colors.crust, fg = colors.crust },
        TelescopePreviewNormal = { bg = colors.crust },
        TelescopePreviewTitle = { bg = colors.crust, fg = colors.text },
        TelescopePromptBorder = { bg = colors.crust, fg = colors.crust },
        TelescopePromptNormal = { bg = colors.crust },
        TelescopePromptTitle = { bg = colors.crust, fg = colors.text },
        TelescopeResultsTitle = { bg = colors.crust, fg = colors.text },
        TelescopeSelection = {
            bg = colors.crust,
            fg = colors.green,
            style = "NONE",
        },
        TelescopeMultiSelection = { bg = colors.crust },

        -- ToggleTerm
        ToggleTerm1FloatBorder = { bg = colors.crust, fg = colors.crust },
        ToggleTerm1NormalFloat = { bg = colors.crust },

        -- Treesitter
        -- TSNamespace = { style = "NONE" },
        -- TSParameter = { style = "NONE" },
        -- TSKeywordOperator = { style = "italic" },
        TreesitterContext = { bg = colors.surface0 },
        TreesitterContextLineNumber = { bg = colors.surface0 },

        -- Disable bold
        -- ErrorMsg = { style = "italic" },
        -- MatchParen = { style = "NONE" },
        -- ModeMsg = { style = "NONE" },
        -- QuickFixLine = { style = "NONE" },
        -- Title = { style = "NONE" },
        -- VisualNOS = { style = "NONE" },
        -- Bold = { style = "NONE" },
        -- Todo = { style = "NONE" },
        -- htmlH1 = { style = "NONE" },
        -- htmlH2 = { style = "NONE" },
        -- mkdCodeStart = { style = "NONE" },
        -- mkdCodeEnd = { style = "NONE" },
        -- TSTextReference = { style = "NONE" },
        -- TSTitle = { style = "NONE" },
        -- TSStrong = { style = "NONE" },
        -- LightspeedShorcutOverlapped = { style = "NONE" },
        -- NvimTreeRootFolder = { style = "NONE" },
        -- NeoTreeRootName = { style = "NONE" },
        -- markdownHeadingDelimiter = { style = "NONE" },
        -- HopNextKey = { style = "underline" },
        -- HopNextKey1 = { style = "NONE" },
        -- HopNextKey2 = { style = "italic" },
        -- CmpItemAbbrMatch = { style = "NONE" },
        -- CmpItemAbbrMatchFuzzy = { style = "NONE" },
    },
})

vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha

local feline_loaded, feline = pcall(require, "feline")

if feline_loaded == false then
    print("feline not loaded")
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
    theme = require("config.feline.themes.catppuccin").palette(),
    components = require("config.feline.themes.catppuccin").components(),
})

vim.cmd([[colorscheme catppuccin]])
