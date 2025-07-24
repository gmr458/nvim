return {
    'neovim/nvim-lspconfig',
    cmd = { 'Start' },
    dependencies = {
        require 'gmr.plugins.lazydev',
        require 'gmr.plugins.luvit-meta',
        { 'b0o/SchemaStore.nvim' },
    },
    config = function()
        vim.api.nvim_create_user_command('Start', function()
            local lspconfiguser = require 'gmr.configs.lsp'
            lspconfiguser.setup_diagnostic_config()

            local servers = require('gmr.configs.lsp.servers').to_setup
            for _, server in pairs(servers) do
                local server_opts = {
                    on_attach = lspconfiguser.on_attach,
                }

                local has_custom_opts, server_custom_opts =
                    pcall(require, 'gmr.configs.lsp.settings.' .. server)
                if has_custom_opts then
                    server_opts = vim.tbl_deep_extend(
                        'force',
                        server_opts,
                        server_custom_opts
                    )
                end

                local has_custom_commands, server_custom_commands =
                    pcall(require, 'gmr.configs.lsp.commands.' .. server)
                if has_custom_commands then
                    server_opts.commands = server_custom_commands
                end

                vim.lsp.config(server, server_opts)
                vim.lsp.enable(server)
            end
        end, {})

        vim.api.nvim_create_user_command('LspCheckhealth', function()
            vim.cmd ':silent :vertical checkhealth vim.lsp'
        end, {})
    end,
}
