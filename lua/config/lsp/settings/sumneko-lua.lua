return {
    settings = {
        Lua = {
            completion = {
                keywordSnippet = "Replace",
                callSnippet = "Replace",
            },
            diagnostics = { globals = { "vim" } },
            runtime = { version = "LuaJIT" },
            telemetry = { enable = false },
            workspace = { library = vim.api.nvim_get_runtime_file("", true) },
        },
    },
}
