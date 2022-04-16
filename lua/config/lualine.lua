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
            "NvimTree",
            "packer",
            "toggleterm",
            "lsp-installer",
            "TelescopePrompt",
        },
        always_divide_middle = true,
        globalstatus = true,
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = {
            { "branch", icon = "" },
            { "diff" },
            {
                "diagnostics",
                symbols = {
                    error = " ",
                    warn = " ",
                    info = " ",
                    hint = " ",
                },
            },
        },
        lualine_c = { "filename" },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
    },
})
