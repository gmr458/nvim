local status_ok, catppuccin = pcall(require, "catppuccin")

if not status_ok then
    return
end

catppuccin.setup({
    transparent_background = false,
    term_colors = true,
    styles = {
        comments = "NONE",
        functions = "NONE",
        keywords = "NONE",
        strings = "NONE",
        variables = "NONE",
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
        bufferline = false,
        markdown = false,
        lightspeed = false,
        ts_rainbow = true,
        hop = false,
        notify = false,
        telekasten = false,
        symbols_outline = true,
    },
})

local colors = require("catppuccin.api.colors").get_colors()

catppuccin.remap({
    CmpPMenu = { bg = colors.black1 },
    CmpPMenuBorder = { bg = colors.black1, fg = colors.black1 },
    FloatBorder = { bg = colors.black1, fg = colors.black1 },
    NormalFloat = { bg = colors.black1 },
    StatusLine = { bg = colors.black2 },
    TelescopeBorder = {
        bg = colors.black1,
        fg = colors.black1,
    },
    TelescopeNormal = { bg = colors.black1 },
    TelescopePreviewBorder = {
        bg = colors.black1,
        fg = colors.black1,
    },
    TelescopePreviewNormal = { bg = colors.black1 },
    TelescopePreviewTitle = { bg = colors.black1 },
    TelescopePromptBorder = {
        bg = colors.black1,
        fg = colors.black1,
    },
    TelescopePromptNormal = {
        bg = colors.black1,
    },
    TelescopePromptTitle = {
        bg = colors.black1,
        fg = colors.white,
    },
    ToggleTerm1NormalFloat = {
        bg = colors.black1,
    },
    ToggleTerm1FloatBorder = {
        bg = colors.black1,
        fg = colors.black1,
    },
})

vim.cmd([[colorscheme catppuccin]])
