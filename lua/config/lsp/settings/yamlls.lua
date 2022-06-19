local status_ok, schemastore = pcall(require, "schemastore")

local schemas = {}

if status_ok then
    schemas = schemastore.json.schemas({ select = { "docker-compose.yml" } })
end

return { settings = { yaml = { schemas = schemas } } }
