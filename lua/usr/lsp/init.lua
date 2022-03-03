local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

require("usr.lsp.lsp-installer")
require("usr.lsp.handlers").setup()
