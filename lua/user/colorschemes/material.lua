local status_ok, material = pcall(require, "material")
if not status_ok then
    return
end

material.setup({
    contrast = {
        sidebars = true,
    },
    custom_highlights = {
        NvimTreeVertSplit = { bg = "#090B10" },
        StatusLineNC = { bg = "#090B10" },
    },
})

vim.g.material_style = "deep ocean"

vim.cmd("colorscheme material")
