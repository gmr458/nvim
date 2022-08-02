local onedark_loaded, onedark = pcall(require, "onedark")

if onedark_loaded == false then
    print("onedark not loaded")
    return
end

local style = "deep" -- Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'

onedark.setup({
    style = style,
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

        -- TreesitterContext
        TreesitterContext = { bg = "$bg3" },
        TreesitterContextLineNumber = { bg = "$bg3" },
    }, -- Override highlight groups
    diagnostics = {
        darker = false, -- darker colors for diagnostic
        undercurl = true, -- use undercurl instead of underline for diagnostics
        background = false, -- use background color for virtual text
    },
})

onedark.load()

local feline_loaded, feline = pcall(require, "feline")

if feline_loaded == false then
    print("feline not loaded")
    return
end

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
    theme = require("config.feline.themes.onedark").palette(style),
    components = require("config.feline.themes.onedark").components(),
})
