local ok, schemastore = pcall(require, 'schemastore')
if not ok then
    vim.notify 'schemastore could not be loaded'
    return {}
end

local schemas = schemastore.yaml.schemas()

local compose_schema =
    'https://raw.githubusercontent.com/compose-spec/compose-go/master/schema/compose-spec.json'

local compose_file_match = schemas[compose_schema]
if type(compose_file_match) == 'string' then
    compose_file_match = { compose_file_match }
end

schemas[compose_schema] = vim.list_extend(compose_file_match or {}, {
    'stack.yaml',
    'stack.yml',
})

--- @type vim.lsp.Config
return {
    settings = {
        redhat = {
            telemetry = {
                enabled = false,
            },
        },
        yaml = {
            schemaStore = {
                enable = false,
                url = '',
            },
            schemas = schemas,
            validate = { enable = true },
            format = { enable = true },
        },
    },
}
