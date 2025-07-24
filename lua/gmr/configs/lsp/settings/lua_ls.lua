-- https://luals.github.io/wiki/settings/

--- @class vim.lsp.Config
local config = {
    settings = {
        Lua = {
            completion = {
                callSnippet = 'Replace',
                keywordSnippet = 'Replace',
            },
            hint = { enable = true },
            telemetry = { enable = false },
            workspace = { checkThirdParty = false },
        },
    },
}

return config
