local status_ok, catppuccin = pcall(require, "catppuccin")
if not status_ok then
    return
end

catppuccin.setup({
    transparent_background = false,
    term_colors = true,
    styles = {
        comments = "italic",
        functions = "none",
        keywords = "none",
        strings = "none",
        variables = "none",
    },
    integrations = {
        treesitter = true,
        native_lsp = {
            enabled = true,
            virtual_text = {
                errors = "italic",
                hints = "italic",
                warnings = "italic",
                information = "italic",
            },
            underlines = {
                errors = "underline",
                hints = "underline",
                warnings = "underline",
                information = "underline",
            },
        },
        lsp_trouble = false,
        cmp = true,
        lsp_saga = true,
        gitgutter = false,
        gitsigns = true,
        telescope = true,
        nvimtree = {
            enabled = true,
            show_root = true,
            transparent_panel = false,
        },
        which_key = false,
        indent_blankline = {
            enabled = false,
            colored_indent_levels = false,
        },
        dashboard = false,
        neogit = false,
        vim_sneak = false,
        fern = false,
        barbar = false,
        bufferline = true,
        markdown = true,
        lightspeed = false,
        ts_rainbow = true,
        hop = false,
        notify = false,
        telekasten = false,
    },
})

local colors = require("catppuccin.api.colors").get_colors()
catppuccin.remap({ NvimTreeVertSplit = { fg = colors.black1, bg = colors.black1 } })

vim.cmd([[colorscheme catppuccin]])
