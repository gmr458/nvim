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

        vim.api.nvim_create_autocmd('FileType', {
            group = vim.api.nvim_create_augroup(
                'gmr_start_treesitter',
                { clear = true }
            ),
            callback = function(ev)
                local lang = vim.treesitter.language.get_lang(ev.match)
                if lang == nil then
                    return
                end
                if vim.treesitter.query.get(lang, 'highlights') ~= nil then
                    vim.treesitter.start(ev.buf, lang)
                end
                if vim.treesitter.query.get(lang, 'folds') ~= nil then
                    vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
                    vim.wo.foldmethod = 'expr'
                end
                if vim.treesitter.query.get(lang, 'indents') ~= nil then
                    vim.bo.indentexpr =
                        'v:lua.require\'nvim-treesitter\'.indentexpr()'
                end
            end,
        })
    end,
}
