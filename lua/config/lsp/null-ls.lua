local null_ls_loaded, null_ls = pcall(require, "null-ls")

if not null_ls_loaded then
    print("null-ls not loaded")
    return
end

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.djlint.with({
            extra_args = { "--preserve-leading-space", "--preserve-blank-lines", "--indent", "2" },
        }),
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.rubocop,
        null_ls.builtins.formatting.rustfmt,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.taplo,
        null_ls.builtins.diagnostics.djlint.with({ method = null_ls.methods.DIAGNOSTICS_ON_SAVE }),
        null_ls.builtins.diagnostics.pylint.with({ method = null_ls.methods.DIAGNOSTICS_ON_SAVE }),
        null_ls.builtins.diagnostics.golangci_lint,
    },
})

local null_ls_stop = function()
    local null_ls_client

    for _, client in ipairs(vim.lsp.get_active_clients()) do
        if client.name == "null-ls" then
            null_ls_client = client
        end
    end

    if not null_ls_client then
        return
    end

    null_ls_client.stop()
end

vim.api.nvim_create_user_command("NullLsStop", null_ls_stop, {})
