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
            enabled = false,
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

-- local config = require("catppuccin.config").options
-- local nvimtree = config.integrations.nvimtree
-- local colors = require("catppuccin.api.colors").get_colors()

-- local remap_none = {
--     bashTSFuncBuiltin = { style = "NONE" },
--     bashTSParameter = { style = "NONE" },
--     cssTSProperty = { style = "NONE" },
--     ErrorMsg = { style = "NONE" },
--     NormalFloat = {
--         bg = config.transparent_background and "NONE" or colors.black2,
--     },
--     NvimTreeStatusLine = {
--         bg = nvimtree.enabled and colors.black1 or "none",
--         fg = nvimtree.enabled and colors.black1 or "none",
--     },
--     NvimTreeStatuslineNc = {
--         bg = nvimtree.enabled and colors.black1 or "none",
--         fg = nvimtree.enabled and colors.black1 or "none",
--     },
--     NvimTreeVertSplit = { bg = nvimtree.enabled and colors.black1 or "NONE" },
--     -- Pmenu = { bg = colors.black2 },
--     Pmenu = {
--         bg = config.transparent_background and colors.black2 or colors.black3,
--     },
--     TSProperty = { style = "NONE" },
--     TSInclude = { style = "NONE" },
--     TSOperator = { style = "NONE" },
--     TSKeywordOperator = { style = "NONE" },
--     TSPunctSpecial = { style = "NONE" },
--     TSFloat = { style = "NONE" },
--     TSNumber = { style = "NONE" },
--     TSBoolean = { style = "NONE" },
--     TSConditional = { style = "NONE" },
--     TSRepeat = { style = "NONE" },
--     TSException = { style = "NONE" },
--     TSConstBuiltin = { style = "NONE" },
--     TSFuncBuiltin = { style = "NONE" },
--     TSTypeBuiltin = { style = "NONE" },
--     TSVariableBuiltin = { style = "NONE" },
--     TSFunction = { style = "NONE" },
--     TSParameter = { style = "NONE" },
--     TSKeywordFunction = { style = "NONE" },
--     TSKeyword = { style = "NONE" },
--     TSKeywordReturn = { style = "NONE" },
--     TSMethod = { style = "NONE" },
--     TSNamespace = { style = "NONE" },
--     TSStringRegex = { style = "NONE" },
--     TSVariable = { style = "NONE" },
--     TSTagAttribute = { style = "NONE" },
--     TSURI = { style = "underline" },
--     TSLiteral = { style = "NONE" },
--     TSEmphasis = { style = "NONE" },
--     TSStringEscape = { style = "NONE" },
--     typescriptTSProperty = { style = "NONE" },
-- }

-- local remap_italic = {
--     bashTSFuncBuiltin = { style = "NONE" },
--     bashTSParameter = { style = "NONE" },
--     cssTSProperty = { style = "NONE" },
--     ErrorMsg = { style = "NONE" },
--     NormalFloat = {
--         bg = config.transparent_background and "NONE" or colors.black2,
--     },
--     NvimTreeStatusLine = {
--         bg = nvimtree.enabled and colors.black1 or "none",
--         fg = nvimtree.enabled and colors.black1 or "none",
--     },
--     NvimTreeStatuslineNc = {
--         bg = nvimtree.enabled and colors.black1 or "none",
--         fg = nvimtree.enabled and colors.black1 or "none",
--     },
--     NvimTreeVertSplit = { bg = nvimtree.enabled and colors.black1 or "NONE" },
--     -- Pmenu = { bg = colors.black2 },
--     Pmenu = {
--         bg = config.transparent_background and colors.black2 or colors.black3,
--     },
--     TSProperty = { style = "NONE" },
--     TSInclude = { style = "italic" },
--     TSOperator = { style = "NONE" },
--     TSKeywordOperator = { style = "NONE" },
--     TSPunctSpecial = { style = "NONE" },
--     TSFloat = { style = "NONE" },
--     TSNumber = { style = "NONE" },
--     TSBoolean = { style = "italic" },
--     TSConditional = { style = "italic" },
--     TSRepeat = { style = "italic" },
--     TSException = { style = "NONE" },
--     TSConstBuiltin = { style = "italic" },
--     TSFuncBuiltin = { style = "italic" },
--     TSTypeBuiltin = { style = "italic" },
--     TSVariableBuiltin = { style = "italic" },
--     TSFunction = { style = "NONE" },
--     TSParameter = { style = "NONE" },
--     TSKeywordFunction = { style = "italic" },
--     TSKeyword = { style = "italic" },
--     TSKeywordReturn = { style = "italic" },
--     TSMethod = { style = "italic" },
--     TSNamespace = { style = "NONE" },
--     TSStringRegex = { style = "NONE" },
--     TSVariable = { style = "NONE" },
--     TSTagAttribute = { style = "NONE" },
--     TSURI = { style = "underline" },
--     TSLiteral = { style = "italic" },
--     TSEmphasis = { style = "NONE" },
--     TSStringEscape = { style = "NONE" },
--     typescriptTSProperty = { style = "NONE" },
-- }

-- catppuccin.remap(remap_none)

vim.cmd([[colorscheme catppuccin]])
