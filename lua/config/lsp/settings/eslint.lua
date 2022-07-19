local util = require("lspconfig.util")

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
