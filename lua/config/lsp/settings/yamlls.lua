local schemastore_loaded, schemastore = pcall(require, "schemastore")

local schemas = {}

if schemastore_loaded then
    schemas = schemastore.json.schemas({ select = { "docker-compose.yml" } })
end

return { settings = { yaml = { schemas = schemas } } }
