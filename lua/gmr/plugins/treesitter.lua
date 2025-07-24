return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    branch = 'main',
    build = ':TSUpdate',
    config = function()
        local config_parsers = require 'gmr.configs.treesitter.parsers'
        local parsers = config_parsers.install_automatically()

        vim.api.nvim_create_user_command('TSInstallAll', function()
            require('nvim-treesitter').install(parsers, { max_jobs = 1 })
        end, {})

        table.insert(parsers, 'cs')
        table.insert(parsers, 'hyprlang')
        table.insert(parsers, 'javascriptreact')
        table.insert(parsers, 'typescriptreact')

        vim.api.nvim_create_autocmd('FileType', {
            pattern = parsers,
            callback = function()
                vim.treesitter.start()
                vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
                vim.bo.indentexpr =
                    'v:lua.require\'nvim-treesitter\'.indentexpr()'
            end,
        })
    end,
}
