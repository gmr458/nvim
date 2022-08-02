local colorizer_loaded, colorizer = pcall(require, "colorizer")

if colorizer_loaded == false then
    print("colorizer not loaded")
    return
end

colorizer.setup({
    "conf",
    "css",
    "html",
    "javascript",
    "json",
    "jsonc",
    "lua",
    "yaml",
})
