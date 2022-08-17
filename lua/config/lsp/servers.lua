local M = {}

local utils = require("config.utils")

M.get_servers = function()
    if utils.running_windows() or utils.running_wsl() then
        return {}
    end

    return {
        -- "angularls",
        "bashls",
        "clangd",
        "cssls",
        "denols",
        "dockerls",
        "emmet_ls",
        "eslint",
        "golangci_lint_ls",
        "gopls",
        "html",
        "intelephense",
        "jdtls",
        "jsonls",
        "kotlin_language_server",
        -- "omnisharp",
        "pyright",
        "rust_analyzer",
        -- "solargraph",
        "sqls",
        "sumneko_lua",
        "tailwindcss",
        "taplo",
        "tsserver",
        "vimls",
        "yamlls",
    }
end

return M
