local M = {}

M.get_filetypes_lsp_use = function()
    if require("config.utils").running_wsl() then
        return {}
    end

    return {
        "c",
        "cmd",
        "cpp",
        "cs",
        "css",
        "django-html",
        "dockerfile",
        "go",
        "gomod",
        "html",
        "htmldjango",
        "java",
        "javascript",
        "javascriptreact",
        "json",
        "jsonc",
        "kotlin",
        "lua",
        "php",
        "python",
        "ruby",
        "rust",
        "sh",
        "sql",
        "toml",
        "typescript",
        "typescriptreact",
        "vim",
        "yaml",
    }
end

return M
