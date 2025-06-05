local tsserver_path = vim.fn.expand '$MASON/packages/typescript-language-server'

local config = {
    init_options = {
        typescript = {
            tsdk = tsserver_path .. '/node_modules/typescript/lib',
        },
    },
}

return config
