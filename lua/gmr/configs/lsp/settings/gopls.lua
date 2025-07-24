-- https://github.com/golang/tools/blob/master/gopls/doc/settings.md

--- @class vim.lsp.Config
local config = {
    settings = {
        gopls = {
            gofumpt = true,
            usePlaceholders = false,
            semanticTokens = false,
            ['ui.inlayhint.hints'] = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = false,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
            },
        },
    },
}

return config
