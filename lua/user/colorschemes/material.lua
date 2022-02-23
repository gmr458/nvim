local status_ok, material = pcall(require, "material")
if not status_ok then
    return
end

material.setup({
    contrast = {
        sidebars = true,
    },
    italics = {
        comments = true,
        keywords = true,
    },
})

vim.g.material_style = "deep ocean"

vim.cmd("colorscheme material")
