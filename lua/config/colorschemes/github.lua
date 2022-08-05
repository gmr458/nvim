local github_theme_loaded, github = pcall(require, "github-theme")

if not github_theme_loaded then
    print("github-theme not loaded")
    return
end

local theme = "dark_default" -- dark, dimmed, dark_default, dark_colorblind, light, light_default, light_colorblind

github.setup({
    comment_style = "italic",
    dark_sidebar = true,
    dev = true,
    function_style = "NONE",
    keyword_style = "NONE",
    overrides = function(c)
        return {
            -- Float
            FloatBorder = { bg = c.bg2, fg = c.bg2 },
            NormalFloat = { bg = c.bg2 },

            -- StatusLine
            StatusLine = { bg = c.bg },
            StatusLineNC = { bg = c.bg },

            -- NvimTree
            NvimTreeWinSeparator = { bg = c.bg, fg = c.bg },

            -- WinSeparator
            WinSeparator = { fg = c.bg2 },

            --Telescope
            TelescopeBorder = { bg = c.bg2, fg = c.bg2 },
            TelescopeNormal = { bg = c.bg2 },
            TelescopePreviewBorder = { bg = c.bg2, fg = c.bg2 },
            TelescopePreviewNormal = { bg = c.bg2 },
            TelescopePreviewTitle = { bg = c.bg2, fg = c.fg },
            TelescopePromptBorder = { bg = c.bg2, fg = c.bg2 },
            TelescopePromptNormal = { bg = c.bg2 },
            TelescopePromptTitle = { bg = c.bg2, fg = c.fg },
            TelescopeResultsBorder = { bg = c.bg2, fg = c.bg2 },
            TelescopeResultsTitle = { bg = c.bg2, fg = c.fg },
            TelescopeSelection = { bg = c.bg2, fg = c.green },
            TelescopeMultiSelection = { bg = c.bg2 },

            -- ToggleTerm
            ToggleTerm1FloatBorder = { bg = c.bg2, fg = c.bg2 },
            ToggleTerm1NormalFloat = { bg = c.bg2 },

            -- Treesitter
            goTSConstBuiltin = { fg = c.bright_blue },
            goTSFuncBuiltin = { fg = c.magenta },
            goTSFunction = { fg = c.magenta },
            goTSMethod = { fg = c.magenta },
            goTSProperty = { fg = c.bright_blue },
            goTSType = { fg = c.fg },
            goTSTypeBuiltin = { fg = c.fg },

            -- TreesitterContext
            TreesitterContext = { bg = c.bg_highlight },
            TreesitterContextLineNumber = { bg = c.bg_highlight },
        }
    end,
    theme_style = theme,
    variable_style = "NONE",
})

local feline_loaded, feline = pcall(require, "feline")

if not feline_loaded then
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
    theme = require("config.feline.themes.github").palette(theme),
    components = require("config.feline.themes.github").components(),
})
