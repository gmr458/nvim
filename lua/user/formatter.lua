local status_ok, formatter = pcall(require, "formatter")
if not status_ok then
    return
end

formatter.setup({
    logging = false,
    filetype = {
        go = {
            -- gofmt
            function()
                return { exe = "gofmt", args = { "-w", "." }, stdin = false }
            end,
        },
        html = {
            -- prettier
            function()
                return { exe = "prettier", args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--tab-width 4" }, stdin = true }
            end,
        },
        java = {
            -- google-java-format
            function()
                return {
                    exe = "java",
                    args = {
                        "--add-exports",
                        "jdk.compiler/com.sun.tools.javac.api=ALL-UNNAMED",
                        "--add-exports",
                        "jdk.compiler/com.sun.tools.javac.file=ALL-UNNAMED",
                        "--add-exports",
                        "jdk.compiler/com.sun.tools.javac.parser=ALL-UNNAMED",
                        "--add-exports",
                        "jdk.compiler/com.sun.tools.javac.tree=ALL-UNNAMED",
                        "--add-exports",
                        "jdk.compiler/com.sun.tools.javac.util=ALL-UNNAMED",
                        "-jar",
                        "~/.bin/google-java-format-1.13.0-all-deps.jar",
                        "--replace",
                        "--aosp",
                        vim.api.nvim_buf_get_name(0),
                    },
                    stdin = false,
                }
            end,
        },
        javascript = {
            -- prettier
            function()
                return { exe = "prettier", args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--tab-width 4" }, stdin = true }
            end,
        },
        javascriptreact = {
            -- prettier
            function()
                return { exe = "prettier", args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--tab-width 4" }, stdin = true }
            end,
        },
        json = {
            -- prettier
            function()
                return { exe = "prettier", args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--tab-width 4" }, stdin = true }
            end,
        },
        jsonc = {
            -- prettier
            function()
                return { exe = "prettier", args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--tab-width 4" }, stdin = true }
            end,
        },
        lua = {
            -- stylua
            function()
                return {
                    exe = "stylua",
                    args = { "--indent-type Spaces --indent-width 4 --line-endings Unix --quote-style ForceDouble" },
                    stdin = false,
                }
            end,
        },
        python = {
            -- autopep8
            function()
                return { exe = "autopep8", args = { vim.api.nvim_buf_get_name(0) }, stdin = true }
            end,
        },
        rust = {
            -- rustfmt
            function()
                return { exe = "rustfmt", args = { "--emit=stdout" }, stdin = true }
            end,
        },
        typescript = {
            -- prettier
            function()
                return { exe = "prettier", args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--tab-width 4" }, stdin = true }
            end,
        },
        typescriptreact = {
            -- prettier
            function()
                return { exe = "prettier", args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--tab-width 4" }, stdin = true }
            end,
        },
    },
})
