local status_ok, lualine = pcall(require, "lualine")

if not status_ok then
    return
end

lualine.setup({
    options = {
        icons_enabled = true,
        theme = "kanagawa",
        component_separators = "",
        section_separators = "",
        disabled_filetypes = {
            "alpha",
            -- "NvimTree",
            "packer",
            "toggleterm",
            "lsp-installer",
            "TelescopePrompt",
        },
        always_divide_middle = true,
        globalstatus = true,
    },
})
