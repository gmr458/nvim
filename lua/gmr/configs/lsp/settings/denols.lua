-- https://github.com/denoland/vscode_deno/blob/main/README.md

--- @class vim.lsp.Config
local config = {
    root_markers = { 'deno.json', 'deno.jsonc' },
    workspace_required = true,
    settings = {
        deno = {
            inlayHints = {
                enumMemberValues = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
                parameterNames = {
                    enabled = 'all',
                    suppressWhenArgumentMatchesName = true,
                },
                parameterTypes = { enabled = true },
                propertyDeclarationTypes = { enabled = true },
                variableTypes = {
                    enabled = true,
                    suppressWhenTypeMatchesName = true,
                },
            },
        },
    },
}

return config
