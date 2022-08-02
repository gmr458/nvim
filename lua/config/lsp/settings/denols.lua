local util_loaded, util = pcall(require, "lspconfig.util")

if util_loaded == false then
    print("lspconfig.util not loaded")
    return
end

return {
    root_dir = util.root_pattern("deno.json", "deno.jsonc"),
    single_file_support = false,
}
