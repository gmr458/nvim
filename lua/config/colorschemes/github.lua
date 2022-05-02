local status_ok, github = pcall(require, "github-theme")

if not status_ok then
    return
end

github.setup({
    comment_style = "italic",
    dark_sidebar = false,
    dev = true,
    function_style = "NONE",
    keyword_style = "NONE",
    overrides = function(c)
        return {
            goTSConstBuiltin = { fg = c.bright_blue },
            goTSFuncBuiltin = { fg = c.magenta },
            goTSFunction = { fg = c.magenta },
            goTSMethod = { fg = c.magenta },
            goTSProperty = { fg = c.bright_blue },
            goTSType = { fg = c.fg },
            goTSTypeBuiltin = { fg = c.fg },
            StatusLine = { bg = c.bg },
            StatusLineNC = { bg = c.bg },
            WinSeparator = { fg = c.bg2 },
        }
    end,
    theme_style = "dark_default", -- dark, dimmed, dark_default, dark_colorblind, light, light_default, light_colorblind
    variable_style = "NONE",
})
