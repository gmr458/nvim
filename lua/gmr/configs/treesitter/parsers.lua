local M = {}

function M.install_automatically()
    local utils = require 'gmr.core.utils'

    if
        vim.uv.os_uname().sysname == 'Windows_NT'
        or utils.running_wsl()
        or utils.running_android()
    then
        return {}
    end

    return {
        'astro',
        'c',
        'caddy',
        'c_sharp',
        'css',
        'diff',
        'dockerfile',
        'git_config',
        'git_rebase',
        'gitattributes',
        'gitcommit',
        'gitignore',
        'go',
        'gomod',
        'gosum',
        'gowork',
        'html',
        'htmldjango',
        'hyprlang',
        'java',
        'javascript',
        'jsdoc',
        'json',
        'kdl',
        'kotlin',
        'latex',
        'lua',
        'luadoc',
        'luap',
        'luau',
        'markdown',
        'markdown_inline',
        'norg',
        'nu',
        'ocaml',
        'ocaml_interface',
        'ocamllex',
        'python',
        'query',
        'regex',
        'requirements',
        'rust',
        'scss',
        'scheme',
        'sql',
        'svelte',
        'toml',
        'tsx',
        'typescript',
        'typst',
        'vim',
        'vimdoc',
        'vue',
        'xml',
        'yaml',
        'zig',
    }
end

return M
