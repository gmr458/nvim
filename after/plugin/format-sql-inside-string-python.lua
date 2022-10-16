local run_formatter = function(sql_string_input)
    sql_string_input = sql_string_input:gsub("%\"", "")

    local script_formatter = vim.api.nvim_get_runtime_file("scripts/format-sql-inside-string-python.py", false)[1]

    local j = require("plenary.job"):new({
        command = "python",
        args = { script_formatter },
        writer = { sql_string_input },
    })

    return j:sync()
end

local embedded_sql = vim.treesitter.parse_query(
    "python",
    [[
        (call
            (attribute
                ; object: (identifier) @object
                attribute: (identifier) @attribute (#eq? @attribute "execute"))
        (argument_list
            (string) @sql_string))
    ]]
)

local get_root = function(bufnr)
    local parser = vim.treesitter.get_parser(bufnr, "python", {})
    local tree = parser:parse()[1]
    return tree:root()
end

local format_sql_inside_string_python = function(bufnr)
    bufnr = bufnr or vim.api.nvim_get_current_buf()

    if vim.bo[bufnr].filetype ~= "python" then
        vim.notify("This can only be used in Python")
        return
    end

    local root = get_root(bufnr)

    local changes = {}

    for id, node in embedded_sql:iter_captures(root, bufnr, 0, -1) do
        local name = embedded_sql.captures[id]

        if name == "sql_string" then
            -- { start row, start col, end row, end col }
            local range = { node:range() }
            local indentation = string.rep(" ", range[2])

            -- Run the formatter, based on the node text
            local formatted = run_formatter(vim.treesitter.get_node_text(node, bufnr))

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

    for _, change in ipairs(changes) do
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

vim.api.nvim_create_user_command("FormatSQLStringPython", function()
    format_sql_inside_string_python()
end, {})
