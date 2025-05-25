local path = vim.fn.exepath 'omnisharp'

--- @class vim.lsp.Config
local config = {
    cmd = {
        'dotnet',
        path .. '/libexec/OmniSharp.dll',
    },
}

return config
