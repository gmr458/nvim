local status_ok, catppuccin = pcall(require, "catppuccin")

if not status_ok then
    return
end

catppuccin.setup({
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
    },
})

local colors = require("catppuccin.api.colors").get_colors()

catppuccin.remap({
    -- BufferLine
    BufferLineCloseButton = { bg = "#161622" },
    BufferLineIndicatorVisible = { bg = colors.mantle },

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
    TelescopeSelection = { bg = colors.crust, fg = colors.green },
    TelescopeMultiSelection = { bg = colors.crust },

    -- ToggleTerm
    ToggleTerm1FloatBorder = { bg = colors.crust, fg = colors.crust },
    ToggleTerm1NormalFloat = { bg = colors.crust },

    -- Treesitter
    TSNamespace = { style = "NONE" },
    TSParameter = { style = "NONE" },
})

vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha

vim.cmd([[colorscheme catppuccin]])
