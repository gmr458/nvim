local status_ok, schemastore = pcall(require, "schemastore")

local schemas = {}

if status_ok then
    schemas = schemastore.json.schemas()
end

return {
    settings = { json = { schemas = schemas } },
    setup = {
        commands = {
            Format = {
                function()
                    vim.lsp.buf.range_formatting(
                        {},
                        { 0, 0 },
                        { vim.fn.line("$"), 0 }
                    )
                end,
            },
        },
    },
}
