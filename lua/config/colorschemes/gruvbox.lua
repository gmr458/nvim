local status_ok, gruvbox = pcall(require, "gruvbox")

if not status_ok then
    return
end

local palette = require("gruvbox.palette")

local bg_alt_1 = "#181a1b"
local bg_alt_0 = "#0f1112"

gruvbox.setup({
    undercurl = true,
    underline = false,
    bold = false,
    italic = true, -- will make italic comments and special strings
    inverse = false, -- invert background for search, diffs, statuslines and errors
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    contrast = "hard", -- can be "hard" or "soft"
    overrides = {
        -- Float
        FloatBorder = { bg = bg_alt_0, fg = bg_alt_0 },
        NormalFloat = { bg = bg_alt_0 },

        BufferLineFill = { bg = bg_alt_0 },

        -- NvimTree
        NvimTreeNormal = { bg = bg_alt_1 },
        NvimTreeWinSeparator = {
            bg = palette.dark0_hard,
            fg = palette.dark0_hard,
        },

        -- Telescope
        TelescopeBorder = { bg = bg_alt_0, fg = bg_alt_0 },
        TelescopeNormal = { bg = bg_alt_0 },
        TelescopePreviewBorder = { bg = bg_alt_0, fg = bg_alt_0 },
        TelescopePreviewNormal = { bg = bg_alt_0 },
        TelescopePreviewTitle = { bg = bg_alt_0, fg = palette.light0 },
        TelescopePromptBorder = { bg = bg_alt_0, fg = bg_alt_0 },
        TelescopePromptNormal = { bg = bg_alt_0 },
        TelescopePromptTitle = { bg = bg_alt_0, fg = palette.light0 },
        TelescopeResultsTitle = { bg = bg_alt_0, fg = palette.light0 },
        TelescopeResultsBorder = { bg = bg_alt_0, fg = bg_alt_0 },
        TelescopeSelection = {
            bg = bg_alt_0,
            fg = palette.bright_aqua,
        },
        TelescopeMultiSelection = { bg = bg_alt_0 },

        -- ToggleTerm
        ToggleTerm1NormalFloat = { bg = bg_alt_0 },
        ToggleTerm1FloatBorder = { bg = bg_alt_0, fg = bg_alt_0 },

        -- TreesitterContext
        TreesitterContext = { bg = palette.dark0_soft },
        TreesitterContextLineNumber = { bg = palette.dark0_soft },

        -- SignColumn
        SignColumn = { bg = palette.dark0_hard },

        -- GitSigns
        GitSignsAdd = { bg = palette.dark0_hard, fg = palette.bright_green },
        GitSignsChange = {
            bg = palette.dark0_hard,
            fg = palette.bright_orange,
        },
        GitSignsDelete = { bg = palette.dark0_hard, fg = palette.bright_red },

        Search = { bg = palette.bright_yellow, fg = palette.dark0_hard },

        -- StatusLine
        StatusLine = { bg = palette.dark0_hard },
    },
})

local status_feline, feline = pcall(require, "feline")

if not status_feline then
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
    theme = require("config.feline.themes.gruvbox").palette(),
    components = require("config.feline.themes.gruvbox").components(),
})

vim.cmd([[colorscheme gruvbox]])
