local status_ok, github = pcall(require, "github-theme")

if not status_ok then
    return
end

github.setup({
    theme_style = "dark_default",
    dark_sidebar = true,
    comment_style = "italic",
    keyword_style = "italic",
    function_style = "italic",
    variable_style = "NONE",
    overrides = function(c)
        return {
            VertSplit = { bg = c.bg_sidebar },
            StatusLine = { bg = c.bg_sidebar },
            StatusLineNC = { bg = c.bg_sidebar },
        }
    end,
})
