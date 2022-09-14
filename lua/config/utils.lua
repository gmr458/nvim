local M = {}

M.running_wsl = function()
    if vim.loop.os_uname().sysname == "Linux" then
        local kernel_release = vim.fn.system({ "uname", "-r" })
        return string.find(kernel_release, "WSL", 1, true) ~= nil
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
    "diff",
    "django-html",
    "dockerfile",
    "dosini",
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
    "rasi",
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
