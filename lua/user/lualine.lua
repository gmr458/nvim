local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

lualine.setup({
    options = {
        icons_enabled = true,
        theme = "gruvbox_dark_transparency_custom",
        component_separators = { "", "" },
        section_separators = { "", "" },
        disabled_filetypes = { "NvimTree", "packer", "toggleterm" },
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "filename" },
        lualine_c = {
            { "branch", icon = "" },
            {
                "diff",
                symbols = { added = "+", modified = "~", removed = "-" },
            },
        },
        lualine_x = {
            {
                "diagnostics",
                sources = { "nvim_diagnostic" },
                sections = { "error", "warn", "info", "hint" },
            },
        },
        lualine_y = { "filetype", "location" },
        lualine_z = { "progress" },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    extensions = {},
})
