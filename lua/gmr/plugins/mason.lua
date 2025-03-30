return {
    'williamboman/mason.nvim',
    event = 'BufReadPost',
    config = function()
        require('mason').setup {
            ui = {
                border = 'single',
                backdrop = 100,
                width = 0.8,
                height = 0.7,
                icons = {
                    package_installed = '󰸞',
                    package_pending = '',
                    package_uninstalled = '',
                },
            },
        }

        vim.api.nvim_create_user_command('MasonInstallAll', function()
            local packages = require 'gmr.configs.mason.packages'
            vim.cmd('MasonInstall ' .. table.concat(packages, ' '))
        end, {})
    end,
}
