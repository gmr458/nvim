return {
    'Saghen/blink.cmp',
    event = 'InsertEnter',
    version = '*',
    config = function()
        require('blink-cmp').setup {
            keymap = {
                ['<C-space>'] = {
                    'show',
                    'show_documentation',
                    'hide_documentation',
                },
                ['<C-e>'] = { 'hide' },
                ['<CR>'] = { 'accept', 'fallback' },

                ['<Tab>'] = { 'select_next', 'fallback' },
                ['<S-Tab>'] = { 'select_prev', 'fallback' },
            },
            completion = {
                accept = {
                    resolve_timeout_ms = 10000,
                    auto_brackets = {
                        enabled = false,
                    },
                },
                list = {
                    selection = {
                        auto_insert = true,
                    },
                },
                menu = {
                    auto_show = false,
                    draw = {
                        columns = {
                            {
                                'label',
                                gap = 1,
                            },
                            { 'kind' },
                        },
                    },
                },
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 0,
                },
            },
            signature = {
                trigger = {
                    enabled = false,
                },
            },
            appearance = {
                use_nvim_cmp_as_default = false,
            },
            sources = {
                default = { 'lsp', 'path', 'buffer' },
                providers = {
                    lsp = {
                        timeout_ms = 10000,
                    },
                },
            },
            cmdline = {
                enabled = false,
            },
        }
    end,
}
