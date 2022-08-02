local util_loaded, util = pcall(require, "lspconfig.util")

if util_loaded == false then
    print("lspconfig.util not loaded")
    return
end

return {
    root_dir = util.root_pattern(
        ".eslintrc.js",
        ".eslintrc.cjs",
        ".eslintrc.yaml",
        ".eslintrc.yml",
        ".eslintrc.json",
        "package.json"
    ),
}
