local mason_lspconfig_loaded, mason_lspconfig = pcall(require, "mason-lspconfig")

if mason_lspconfig_loaded == false then
    print("mason-lspconfig not loaded")
    return
end

local servers_loaded, servers = pcall(require, "config.lsp.servers")

if servers_loaded == false then
    print("config.lsp.servers not loaded")
    return
end

mason_lspconfig.setup({ ensure_installed = servers })
