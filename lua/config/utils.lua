local M = {}

M.running_wsl = function()
    if vim.loop.os_uname().sysname == "Linux" then
        local kernel_release = vim.fn.system({ "uname", "-r" })
        return string.find(kernel_release, "WSL", 1, true) ~= nil
    end

    return false
end

M.running_windows = function()
    return vim.loop.os_uname().sysname == "Windows_NT"
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
