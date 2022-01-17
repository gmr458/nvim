local util = require("lspconfig.util")

local opts = {
    root_dir = util.root_pattern("package.json"),
}

return opts
