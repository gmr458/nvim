local status_ok, configs = pcall(require, "nvim-treesitter.configs")

if not status_ok then
    return
end

configs.setup({
    ensure_installed = { -- one of "all", "maintained" (parsers with maintainers), or a list of languages
        "bash",
        "c",
        "c_sharp",
        "cmake",
        "cpp",
        "css",
        "dart",
        "dockerfile",
        "elixir",
        "go",
        "gomod",
        "gowork",
        "graphql",
        "hjson",
        "html",
        "http",
        "java",
        "javascript",
        "jsdoc",
        "json",
        "json5",
        "jsonc",
        "kotlin",
        "llvm",
        "lua",
        "make",
        "markdown",
        "php",
        "pug",
        "python",
        "r",
        "regex",
        "ruby",
        "rust",
        "scala",
        "scss",
        "solidity",
        "svelte",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vue",
        "yaml",
    },
    sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
    ignore_install = {}, -- List of parsers to ignore installing
    autopairs = {
        enable = true,
    },
    autotag = {
        enable = true,
    },
    highlight = {
        enable = true, -- false will disable the whole extension
        disable = { "" }, -- list of language that will be disabled
        additional_vim_regex_highlighting = true,
    },
    indent = {
        enable = true,
        disable = { "go", "html", "css" },
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
    rainbow = {
        enable = true,
        extended_mode = true,
    },
})
