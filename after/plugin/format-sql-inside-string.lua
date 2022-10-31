local run_formatter = function(sql_string_input, filetype)
    if
        string.find(sql_string_input, "\"") == 1
        or string.find(sql_string_input, "'") == 1
        or string.find(sql_string_input, "`") == 1
    then
        sql_string_input = string.sub(sql_string_input, 2, #sql_string_input - 1)
    end

    local script_formatter = vim.api.nvim_get_runtime_file("scripts/format-sql-inside-string.py", false)[1]

    local j = require("plenary.job"):new({
        command = "python",
        args = { script_formatter, filetype },
        writer = { sql_string_input },
    })

    return j:sync()
end

local python_parser_loaded, query_parsed_python = pcall(
    vim.treesitter.parse_query,
    "python",
    [[
        ; query
        (call
            (attribute
                attribute: (identifier) @_attribute (#eq? @_attribute "execute"))
        (argument_list
            (string) @sql_string))
    ]]
)

if not python_parser_loaded then
    return
end

local javascript_parser_loaded, query_parsed_javascript = pcall(
    vim.treesitter.parse_query,
    "javascript",
    [[
        ; query
        (call_expression
            (member_expression
                property: (property_identifier) @_property (#eq? @_property "query"))
        (arguments
            (string) @sql_string))

        (call_expression
            (member_expression
                property: (property_identifier) @_property (#eq? @_property "query"))
        (arguments
            (template_string) @sql_string))
    ]]
)

if not javascript_parser_loaded then
    return
end

local get_root = function(bufnr, filetype)
    local parser = vim.treesitter.get_parser(bufnr, filetype, {})
    local tree = parser:parse()[1]
    return tree:root()
end

local get_changes = function(bufnr, root, query_parsed, filetype)
    local changes = {}

    for id, node in query_parsed:iter_captures(root, bufnr, 0, -1) do
        local name = query_parsed.captures[id]

        if name == "sql_string" then
            -- { start row, start col, end row, end col }
            local range = { node:range() }
            local indentation = string.rep(" ", range[2])

            -- Run the formatter, based on the node text
            local formatted = run_formatter(vim.treesitter.get_node_text(node, bufnr), filetype)

            -- Add some indentation (can be anything you like!)
            for idx, line in ipairs(formatted) do
                if idx > 1 then
                    formatted[idx] = indentation .. line
                end
            end

            -- Keep track of changes
            --    But insert them in reverse order of the file,
            --    so that when we make modifications, we don't have
            --    any out of date line numbers
            table.insert(changes, 1, {
                start_row = range[1],
                start_col = range[2],
                end_row = range[3],
                end_col = range[4],
                formatted = formatted,
            })
        end
    end

    return changes
end

local format_sql_inside_string = function(bufnr)
    bufnr = bufnr or vim.api.nvim_get_current_buf()

    local query_parsed

    local filetype = vim.bo[bufnr].filetype

    if filetype == "python" then
        query_parsed = query_parsed_python
    elseif filetype == "javascript" then
        query_parsed = query_parsed_javascript
    else
        vim.notify("filetype " .. filetype .. "is not suppported")
        return
    end

    local root = get_root(bufnr, filetype)

    local changes = get_changes(bufnr, root, query_parsed, filetype)

    for i, change in ipairs(changes) do
        vim.api.nvim_buf_set_text(
            bufnr,
            change.start_row,
            change.start_col,
            change.end_row,
            change.end_col,
            change.formatted
        )
    end
end

vim.api.nvim_create_user_command("FormatSQLString", function()
    format_sql_inside_string()
end, {})
