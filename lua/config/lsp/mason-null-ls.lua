local mason_null_ls_loaded, mason_null_ls = pcall(require, "mason-null-ls")

if not mason_null_ls_loaded then
    print("mason-null-ls not loaded")
    return
end

mason_null_ls.setup({
    ensure_installed = { "black", "djlint", "prettier", "rubocop", "stylua", "taplo", "pylint", "golangci_lint" },
    automatic_installation = true,
})
