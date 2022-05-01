local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")

if not status_ok then
    return
end

lsp_installer.setup({
    ensure_installed = require("config.lsp.handlers").servers,
    automatic_installation = true,
    ui = {
        icons = {
            server_installed = "✓",
            server_uninstalled = "✗",
        },
    },
})
