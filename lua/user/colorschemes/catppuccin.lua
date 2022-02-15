local status_ok, catppuccin = pcall(require, "catppuccin")
if not status_ok then
    return
end

catppuccin.setup({
    transparent_background = false,
    term_colors = true,
    styles = {
        comments = "italic",
        functions = "NONE",
        keywords = "italic",
        strings = "NONE",
        variables = "NONE",
    },
    integrations = {
        treesitter = true,
        native_lsp = {
            enabled = true,
        },
        lsp_trouble = true,
        cmp = true,
        lsp_saga = true,
        gitsigns = true,
        telescope = true,
        nvimtree = {
            enabled = true,
            transparent_panel = false,
        },
        bufferline = true,
        ts_rainbow = true,
    },
})

local colors = require("catppuccin.api.colors").get_colors()
catppuccin.remap({ NvimTreeVertSplit = { fg = colors.black1, bg = colors.black1 } })

vim.cmd([[colorscheme catppuccin]])
