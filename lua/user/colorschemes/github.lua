local status_ok, github = pcall(require, "github-theme")
if not status_ok then
    return
end

github.setup({ theme_style = "dark_default" })
