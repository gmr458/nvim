local util_loaded, util = pcall(require, "lspconfig.util")

if not util_loaded then
    print("lspconfig.util not loaded")
    return
end

return {
    root_dir = util.root_pattern("package.json"),
}
