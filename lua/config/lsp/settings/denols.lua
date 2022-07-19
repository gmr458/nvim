local util = require("lspconfig.util")

return {
    root_dir = util.root_pattern("deno.json", "deno.jsonc"),
    single_file_support = false,
}
