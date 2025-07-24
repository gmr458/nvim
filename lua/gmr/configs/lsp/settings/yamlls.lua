local ok, schemastore = pcall(require, 'schemastore')
if not ok then
    vim.notify 'schemastore could not be loaded'
    return
end

--- @class vim.lsp.Config
local config = {
    settings = {
        redhat = {
            telemetry = {
                enabled = false,
            },
        },
        yaml = {
            schemas = schemastore.json.schemas(),
            validate = { enable = true },
        },
    },
}

return config
