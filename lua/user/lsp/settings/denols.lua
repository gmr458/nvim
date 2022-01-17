local util = require("lspconfig.util")

local opts = {
    root_dir = util.root_pattern("deno.json", "deno.jsonc"),
}

return opts
