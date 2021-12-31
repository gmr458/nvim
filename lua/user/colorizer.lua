local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
    return
end

colorizer.setup({
    "html",
    "css",
    "javascript",
    "json",
    "jsonc",
    "lua",
})
