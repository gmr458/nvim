local status_ok, material = pcall(require, "material")

if not status_ok then
    return
end

vim.g.material_style = "deep ocean"

local colors = require("material.colors")

local nvimtree = true

material.setup({
    contrast = {
        sidebars = nvimtree,
    },
    italics = {
        comments = true,
        keywords = true,
    },
    custom_highlights = {
        NvimTreeVertSplit = {
            bg = nvimtree and colors.contrast or colors.sidebar,
        },
        NvimTreeStatusLine = {
            bg = nvimtree and colors.contrast or colors.sidebar,
        },
        NvimTreeStatuslineNc = {
            bg = nvimtree and colors.contrast or colors.sidebar,
        },
    },
})

vim.cmd("colorscheme material")
