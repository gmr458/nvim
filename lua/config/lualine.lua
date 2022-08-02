local lualine_loaded, lualine = pcall(require, "lualine")

if lualine_loaded == false then
    print("lualine not loaded")
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
            "lsp-installer",
            "lspinfo",
            "NvimTree",
            "packer",
            "TelescopePrompt",
            "toggleterm",
        },
        always_divide_middle = true,
        globalstatus = true,
    },
})
