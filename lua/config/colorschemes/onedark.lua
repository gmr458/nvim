local status_ok, onedark = pcall(require, "onedark")

if not status_ok then
    return
end

local M = {}

M.style = "deep" -- Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'

onedark.setup({
    style = M.style,
    transparent = false,
    term_colors = true,
    ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
    toggle_style_key = "<leader>ts",
    toggle_style_list = {
        "dark",
        "darker",
        "cool",
        "deep",
        "warm",
        "warmer",
        "light",
    },
    code_style = {
        comments = "italic",
        keywords = "none",
        functions = "none",
        strings = "none",
        variables = "none",
    },
    colors = {}, -- Override default colors
    highlights = {
        -- Float
        FloatBorder = { bg = "$black", fg = "$black" },
        NormalFloat = { bg = "$black" },

        -- NvimTree
        NvimTreeWinSeparator = { bg = "$bg0", fg = "$bg0" },

        -- StatusLine
        StatusLine = { bg = "$bg0" },

        -- Telescope
        TelescopeBorder = { bg = "$black", fg = "$black" },
        TelescopeNormal = { bg = "$black" },
        TelescopePreviewBorder = { bg = "$black", fg = "$black" },
        TelescopePreviewNormal = { bg = "$black" },
        TelescopePreviewTitle = { bg = "$black", fg = "$fg" },
        TelescopePromptBorder = { bg = "$black", fg = "$black" },
        TelescopePromptNormal = { bg = "$black" },
        TelescopePromptTitle = { bg = "$black", fg = "$fg" },
        TelescopeResultsBorder = { bg = "$black", fg = "$black" },
        TelescopeResultsTitle = { bg = "$black", fg = "$fg" },
        TelescopeSelection = { bg = "$black", fg = "$green" },
        TelescopeMultiSelection = { bg = "$black" },

        -- ToggleTerm
        ToggleTerm1FloatBorder = { bg = "$black", fg = "$black" },
        ToggleTerm1NormalFloat = { bg = "$black" },
    }, -- Override highlight groups
    diagnostics = {
        darker = false, -- darker colors for diagnostic
        undercurl = true, -- use undercurl instead of underline for diagnostics
        background = false, -- use background color for virtual text
    },
})

onedark.load()

return M
