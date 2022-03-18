local util = require("lspconfig.util")

local opts = { root_dir = util.root_pattern("tailwind.config.js") }

return opts
