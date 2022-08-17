local mason_lspconfig_loaded, mason_lspconfig = pcall(require, "mason-lspconfig")

if not mason_lspconfig_loaded then
    print("mason-lspconfig not loaded")
    return
end

local servers = require("config.lsp.servers").get_servers()

mason_lspconfig.setup({ ensure_installed = servers, automatic_installation = true })
