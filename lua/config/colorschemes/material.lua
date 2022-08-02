local material_loaded, material = pcall(require, "material")

if material_loaded == false then
    print("material not loaded")
    return
end

vim.g.material_style = "deep ocean"

local colors = require("material.colors")

local nvimtree = true

material.setup({
    contrast = {
        sidebars = nvimtree,
        floating_windows = true, -- Enable contrast for floating windows
        line_numbers = false, -- Enable contrast background for line numbers
        sign_column = false, -- Enable contrast background for the sign column
        cursor_line = false, -- Enable darker background for the cursor line
        non_current_windows = false, -- Enable darker background for non-current windows
        popup_menu = false, -- Enable lighter background for the popup menu
    },
    italics = {
        comments = true, -- Enable italic comments
        keywords = false, -- Enable italic keywords
        functions = false, -- Enable italic functions
        strings = false, -- Enable italic strings
        variables = false, -- Enable italic variables
    },
    contrast_filetypes = { -- Specify which filetypes get the contrasted (darker) background
        "terminal", -- Darker terminal background
        "packer", -- Darker packer background
        "qf", -- Darker qf list background
    },
    high_visibility = {
        lighter = false, -- Enable higher contrast text for lighter style
        darker = false, -- Enable higher contrast text for darker style
    },
    disable = {
        colored_cursor = false, -- Disable the colored cursor
        borders = false, -- Disable borders between verticaly split windows
        background = false, -- Prevent the theme from setting the background (NeoVim then uses your teminal background)
        term_colors = false, -- Prevent the theme from setting terminal colors
        eob_lines = false, -- Hide the end-of-buffer lines
    },
    async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)
    custom_highlights = {
        -- Float
        FloatBorder = { bg = colors.bg_alt, fg = colors.bg_alt },

        -- BufferLine
        BufferLineFill = { bg = colors.bg_alt },

        -- NvimTree
        NvimTreeWinSeparator = { bg = colors.bg, fg = colors.bg },

        -- StatusLine
        StatusLine = { bg = colors.bg },

        -- Telescope
        TelescopeNormal = { bg = colors.bg_alt },
        TelescopePreviewBorder = { bg = colors.bg_alt, fg = colors.bg_alt },
        TelescopePreviewTitle = { bg = colors.bg_alt, fg = colors.fg },
        TelescopePromptBorder = { bg = colors.bg_alt, fg = colors.bg_alt },
        TelescopePromptTitle = { bg = colors.bg_alt, fg = colors.fg },
        TelescopeResultsTitle = { bg = colors.bg_alt, fg = colors.fg },
        TelescopeSelection = { bg = colors.bg_alt, fg = colors.green },
        TelescopeMultiSelection = { bg = colors.bg_alt },
        TelescopeResultsBorder = { bg = colors.bg_alt, fg = colors.bg_alt },

        -- ToggleTerm
        ToggleTerm1FloatBorder = { bg = colors.bg_alt, fg = colors.bg_alt },
        ToggleTerm1NormalFloat = { bg = colors.bg_alt },
    },
})

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
    theme = require("config.feline.themes.material").palette(),
    components = require("config.feline.themes.material").components(),
})

vim.cmd("colorscheme material")
