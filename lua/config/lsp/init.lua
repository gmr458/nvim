local status_ok, _ = pcall(require, "lspconfig")

if not status_ok then
    return
end

require("config.lsp.lsp-installer")
require("config.lsp.handlers").setup()

local servers = require("config.lsp.handlers").servers

for _, server in pairs(servers) do
    local config = {
        on_attach = require("config.lsp.handlers").on_attach,
        capabilities = require("config.lsp.handlers").capabilities,
    }

    if server == "denols" then
        local denols_config = require("config.lsp.settings.denols")
        config = vim.tbl_deep_extend("force", denols_config, config)
    end

    if server == "emmet_ls" then
        local emmet_ls_config = require("config.lsp.settings.emmet-ls")
        config = vim.tbl_deep_extend("force", emmet_ls_config, config)
    end

    if server == "eslint" then
        local eslint_config = require("config.lsp.settings.eslint")
        config = vim.tbl_deep_extend("force", eslint_config, config)
    end

    if server == "html" then
        local html_config = require("config.lsp.settings.html")
        config = vim.tbl_deep_extend("force", html_config, config)
    end

    if server == "jsonls" then
        local jsonls_config = require("config.lsp.settings.jsonls")
        config = vim.tbl_deep_extend("force", jsonls_config, config)
    end

    if server == "sumneko_lua" then
        local sumneko_lua_config = require("config.lsp.settings.sumneko_lua")
        config = vim.tbl_deep_extend("force", sumneko_lua_config, config)
    end

    if server == "tailwindcss" then
        local tailwindcss_config = require("config.lsp.settings.tailwindcss")
        config = vim.tbl_deep_extend("force", tailwindcss_config, config)
    end

    if server == "tsserver" then
        local tsserver_config = require("config.lsp.settings.tsserver")
        config = vim.tbl_deep_extend("force", tsserver_config, config)
    end

    require("lspconfig")[server].setup(config)
end
