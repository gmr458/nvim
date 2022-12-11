local M = {}

M.to_setup = function()
    local utils = require("config.utils")

    if vim.loop.os_uname().sysname == "Windows_NT" or utils.running_wsl() or utils.running_android() then
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
        -- "golangci_lint_ls",
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

M.to_install = {
    "jdtls",
    "clangd",
    "taplo",
    "sqls",
    "intelephense",
    "pyright",
    "gopls",
    "bash-language-server",
    "black",
    "css-lsp",
    "deno",
    "djlint",
    "dockerfile-language-server",
    "emmet-ls",
    "eslint-lsp",
    "golangci-lint",
    "html-lsp",
    "json-lsp",
    "kotlin-language-server",
    "lua-language-server",
    "prettier",
    "pylint",
    "rubocop",
    "rust-analyzer",
    "rustfmt",
    "stylua",
    "tailwindcss-language-server",
    "typescript-language-server",
    "vim-language-server",
    "yaml-language-server",
}

return M
