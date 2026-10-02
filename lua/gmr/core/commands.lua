vim.api.nvim_create_user_command('CopyCurrentFilename', function()
    local filename = vim.fn.expand '%:.'
    if filename == '' then
        return
    end
    vim.fn.setreg('+', filename)
    vim.notify(filename .. ' copied', vim.log.levels.INFO)
end, {})

vim.api.nvim_create_user_command('DeleteAllBuffers', function()
    local bufs = vim.api.nvim_list_bufs()
    vim.cmd('bdelete ' .. table.concat(bufs, ' '))
end, {})

vim.api.nvim_create_user_command('CopyRootName', function()
    local root = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
    if root == '' then
        return
    end
    vim.fn.setreg('+', root)
    vim.notify(root .. ' copied', vim.log.levels.INFO)
end, {})

-- Visual selection / word-under-cursor case conversion.
-- Usage: select with `v` (e.g. `viw`) then `:'<,'>CamelCase`.
-- Without a range (`:CamelCase`) converts the word under the cursor.
local case = require 'gmr.core.case'

local case_commands = {
    CamelCase = case.to_camel,
    PascalCase = case.to_pascal,
    SnakeCase = case.to_snake,
    KebabCase = case.to_kebab,
    ScreamingSnakeCase = case.to_screaming_snake,
    TrainCase = case.to_train,
    ScreamingKebabCase = case.to_screaming_kebab,
    DotCase = case.to_dot,
    PathCase = case.to_path,
    FlatCase = case.to_flat,
    UpperFlatCase = case.to_upper_flat,
    CamelSnakeCase = case.to_camel_snake,
    PascalSnakeCase = case.to_pascal_snake,
}

for name, converter in pairs(case_commands) do
    vim.api.nvim_create_user_command(name, function(opts)
        case.command_handler(opts, converter)
    end, {
        range = true,
        desc = 'Convert visual selection (or word under cursor) to ' .. name,
    })
end
