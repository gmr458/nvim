local null_ls_loaded, null_ls = pcall(require, "null-ls")

if not null_ls_loaded then
    print("null-ls not loaded")
    return
end

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.djlint,
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.rubocop,
        null_ls.builtins.formatting.rustfmt,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.taplo,
    },
})
