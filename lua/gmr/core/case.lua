--- @class gmr.Case
local M = {}

--- Split an identifier / phrase into lowercase words.
--- Handles snake_case, kebab-case, spaces, camelCase, PascalCase,
--- SCREAMING_SNAKE_CASE and acronyms like HTTPRequest.
--- @param s string
--- @return string[]
function M.split_words(s)
    s = s:gsub('(%l)(%u)', '%1 %2')
    s = s:gsub('(%d)(%u)', '%1 %2')
    s = s:gsub('(%l)(%d)', '%1 %2')
    s = s:gsub('(%u)(%u%l)', '%1 %2')
    s = s:gsub('[^A-Za-z0-9]+', ' ')
    local words = {}
    for w in s:gmatch '%S+' do
        table.insert(words, w:lower())
    end
    return words
end

--- Capitalize the first letter and lowercase the rest.
--- @param word string
--- @return string
local function capitalize(word)
    return word:sub(1, 1):upper() .. word:sub(2):lower()
end

--- @param s string
--- @return string
function M.to_camel(s)
    local words = M.split_words(s)
    if #words == 0 then
        return s
    end
    local out = words[1]:lower()
    for i = 2, #words do
        out = out .. capitalize(words[i])
    end
    return out
end

--- @param s string
--- @return string
function M.to_pascal(s)
    local words = M.split_words(s)
    if #words == 0 then
        return s
    end
    local out = {}
    for _, w in ipairs(words) do
        table.insert(out, capitalize(w))
    end
    return table.concat(out, '')
end

--- @param s string
--- @return string
function M.to_snake(s)
    local words = M.split_words(s)
    if #words == 0 then
        return s
    end
    return table.concat(words, '_')
end

--- @param s string
--- @return string
function M.to_kebab(s)
    local words = M.split_words(s)
    if #words == 0 then
        return s
    end
    return table.concat(words, '-')
end

--- @param s string
--- @return string
function M.to_screaming_snake(s)
    local words = M.split_words(s)
    if #words == 0 then
        return s
    end
    local out = {}
    for _, w in ipairs(words) do
        table.insert(out, w:upper())
    end
    return table.concat(out, '_')
end

--- @param s string
--- @return string
function M.to_train(s)
    local words = M.split_words(s)
    if #words == 0 then
        return s
    end
    local out = {}
    for _, w in ipairs(words) do
        table.insert(out, capitalize(w))
    end
    return table.concat(out, '-')
end

--- @param s string
--- @return string
function M.to_screaming_kebab(s)
    local words = M.split_words(s)
    if #words == 0 then
        return s
    end
    local out = {}
    for _, w in ipairs(words) do
        table.insert(out, w:upper())
    end
    return table.concat(out, '-')
end

--- @param s string
--- @return string
function M.to_dot(s)
    local words = M.split_words(s)
    if #words == 0 then
        return s
    end
    return table.concat(words, '.')
end

--- @param s string
--- @return string
function M.to_path(s)
    local words = M.split_words(s)
    if #words == 0 then
        return s
    end
    return table.concat(words, '/')
end

--- @param s string
--- @return string
function M.to_flat(s)
    local words = M.split_words(s)
    if #words == 0 then
        return s
    end
    return table.concat(words, '')
end

--- @param s string
--- @return string
function M.to_upper_flat(s)
    local words = M.split_words(s)
    if #words == 0 then
        return s
    end
    local out = {}
    for _, w in ipairs(words) do
        table.insert(out, w:upper())
    end
    return table.concat(out, '')
end

--- @param s string
--- @return string
function M.to_camel_snake(s)
    local words = M.split_words(s)
    if #words == 0 then
        return s
    end
    local out = { words[1]:lower() }
    for i = 2, #words do
        table.insert(out, capitalize(words[i]))
    end
    return table.concat(out, '_')
end

--- @param s string
--- @return string
function M.to_pascal_snake(s)
    local words = M.split_words(s)
    if #words == 0 then
        return s
    end
    local out = {}
    for _, w in ipairs(words) do
        table.insert(out, capitalize(w))
    end
    return table.concat(out, '_')
end

--- Convert the last visual selection in-place.
--- Preserves newlines by converting each line separately and keeps
--- leading / trailing whitespace per line.
--- @param converter fun(s: string): string
function M.convert_visual(converter)
    local s_pos = vim.fn.getpos '\'<'
    local e_pos = vim.fn.getpos '\'>'
    local s_row = s_pos[2] - 1
    local s_col = s_pos[3] - 1
    local e_row = e_pos[2] - 1
    local e_col = e_pos[3]

    if s_row < 0 or e_row < 0 or s_row > e_row then
        vim.notify('No visual selection', vim.log.levels.WARN)
        return
    end

    local vmode = vim.fn.visualmode()
    if vmode == 'V' then
        -- linewise: convert whole lines
        s_col = 0
        local last_line = vim.api.nvim_buf_get_lines(0, e_row, e_row + 1, false)[1]
            or ''
        e_col = #last_line
    elseif vmode ~= 'v' and vmode ~= '' then
        vim.notify(
            'Blockwise visual conversion is not supported, use charwise (v) or linewise (V)',
            vim.log.levels.WARN
        )
        return
    end

    -- clamp end col to line length (multibyte-safe enough for identifiers)
    local last_line = vim.api.nvim_buf_get_lines(0, e_row, e_row + 1, false)[1]
        or ''
    e_col = math.min(e_col, #last_line)
    -- clamp start col as well
    local first_line = vim.api.nvim_buf_get_lines(0, s_row, s_row + 1, false)[1]
        or ''
    s_col = math.min(s_col, #first_line)

    local ok, text =
        pcall(vim.api.nvim_buf_get_text, 0, s_row, s_col, e_row, e_col, {})
    if not ok or text == nil then
        vim.notify('Could not read visual selection', vim.log.levels.ERROR)
        return
    end

    local converted = {}
    for _, line in ipairs(text) do
        local prefix, core, suffix = line:match '^(%s*)(.-)(%s*)$'
        if core == nil or core == '' then
            table.insert(converted, line)
        else
            table.insert(converted, prefix .. converter(core) .. suffix)
        end
    end

    vim.api.nvim_buf_set_text(0, s_row, s_col, e_row, e_col, converted)
end

--- Convert word under cursor in normal mode (uses viw, so iskeyword-aware).
--- @param converter fun(s: string): string
function M.convert_cword(converter)
    local cword = vim.fn.expand '<cword>'
    if cword == '' then
        vim.notify('No word under cursor', vim.log.levels.WARN)
        return
    end
    if converter(cword) == cword then
        return
    end
    vim.cmd 'normal! viw'
    vim.cmd 'normal! \27' -- leave visual so '< '> marks are set
    M.convert_visual(converter)
end

--- Shared handler for user commands:
--- - `:Cmd` (no range) converts word under cursor
--- - `:'<,'>Cmd` (visual) converts the selection
--- @param opts table passed by nvim_create_user_command
--- @param converter fun(s: string): string
function M.command_handler(opts, converter)
    if opts.range == 0 then
        M.convert_cword(converter)
    else
        M.convert_visual(converter)
    end
end

return M
