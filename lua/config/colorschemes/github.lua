local status_ok, github = pcall(require, "github-theme")

if not status_ok then
    return
end

local M = {}

M.theme = "dark_default" -- dark, dimmed, dark_default, dark_colorblind, light, light_default, light_colorblind

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
            TelescopePreviewTitle = { bg = c.bg2 },
            TelescopePromptBorder = { bg = c.bg2, fg = c.bg2 },
            TelescopePromptNormal = { bg = c.bg2 },
            TelescopePromptTitle = { bg = c.bg2, fg = c.fg },
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
        }
    end,
    theme_style = M.theme,
    variable_style = "NONE",
})

return M
