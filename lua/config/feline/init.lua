local status_ok, feline = pcall(require, "feline")

if not status_ok then
    return
end

local themes = {
    catppuccin = "catppuccin",
    enfocado = "enfocado",
    github = "github",
    gruvbox = "gruvbox",
    gruvbox_material = "gruvbox-material",
    kanagawa = "kanagawa",
    material = "material",
    onedark = "onedark",
}

local theme = themes.enfocado

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
    theme = require("config.feline.themes." .. theme).palette(),
    components = require("config.feline.themes." .. theme).components(),
})
