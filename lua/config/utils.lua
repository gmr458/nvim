local M = {}

M.running_on_wsl = function()
    if vim.fn.has("linux") then
        local kernel_release = vim.fn.system({ "uname", "-r" })

        if string.find(kernel_release, "WSL", 1, true) ~= nil then
            return true
        end

        return false
    end

    return false
end

M.filetypes_simple_use = {
    "asm",
    "c",
    "cmd",
    "conf",
    "cpp",
    "cs",
    "css",
    "django-html",
    "dockerfile",
    "go",
    "gomod",
    "hercules",
    "html",
    "htmldjango",
    "java",
    "javascript",
    "javascriptreact",
    "jproperties",
    "json",
    "jsonc",
    "kotlin",
    "lua",
    "make",
    "markdown",
    "php",
    "proto",
    "python",
    "ruby",
    "rust",
    "sh",
    "sql",
    "tmux",
    "toml",
    "typescript",
    "typescriptreact",
    "vim",
    "xml",
    "yaml",
    "zsh",
}

return M
