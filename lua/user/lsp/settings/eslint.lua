local util = require("lspconfig.util")

local opts = {
    root_dir = util.root_pattern(".eslintrc.js", ".eslintrc.cjs", ".eslintrc.yaml", ".eslintrc.yml", ".eslintrc.json"),
}

return opts
