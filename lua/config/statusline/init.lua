local function mode()
    local current_mode = vim.api.nvim_get_mode().mode
    local modes = require 'config.statusline.modes'
    local mode_str = string.format(' %s ', modes[current_mode]):upper()
    return '%#StatusLineMode#' .. mode_str .. '%*'
end

local function python_env()
    if not rawget(vim, 'lsp') then
        return ''
    end

    local buf = vim.api.nvim_get_current_buf()
    local buf_clients = vim.lsp.get_clients { bufnr = buf }
    if next(buf_clients) == nil then
        return ''
    end

    for _, client in pairs(buf_clients) do
        if client.name == 'pyright' then
            local virtual_env = os.getenv 'VIRTUAL_ENV_PROMPT'
            if virtual_env == nil then
                return ''
            end

            virtual_env = virtual_env:gsub('%s+', '')
            return string.format(' %s', virtual_env)
        end
    end

    return ''
end

local function lsp_servers()
    if not rawget(vim, 'lsp') then
        return ''
    end

    local buf = vim.api.nvim_get_current_buf()
    local buf_clients = vim.lsp.get_clients { bufnr = buf }
    if next(buf_clients) == nil then
        return ''
    end

    local buf_client_names = {}
    for _, client in pairs(buf_clients) do
        if client.name ~= 'null-ls' then
            table.insert(buf_client_names, client.name)
        end
    end

    local unique_client_names = vim.fn.uniq(buf_client_names)
    if type(unique_client_names) == 'table' then
        local clients = table.concat(unique_client_names, ' ')
        return string.format(' %s', clients)
    end

    return ''
end

local function null_ls()
    if not rawget(vim, 'lsp') then
        return ''
    end

    local buf_clients = vim.lsp.get_clients()

    if next(buf_clients) == nil then
        return ''
    end

    local null_ls_running = false

    for _, client in pairs(buf_clients) do
        if client.name == 'null-ls' then
            null_ls_running = true
        end
    end

    if not null_ls_running then
        return ''
    end

    local filetype = vim.bo.filetype

    local ok, sources = pcall(require, 'null-ls.sources')
    if not ok then
        return ''
    end

    local available_sources = sources.get_available(filetype)

    local sources_registered = {}
    for _, source in ipairs(available_sources) do
        table.insert(sources_registered, source.name)
    end

    local active_sources = table.concat(sources_registered, ' ')
    return string.format(' %s', active_sources)
end

local function get_diagnostics_count(severity)
    return vim.tbl_count(
        vim.diagnostic.get(0, severity and { severity = severity })
    )
end

local function diagnostics_error()
    if not rawget(vim, 'lsp') then
        return ''
    end

    local count = get_diagnostics_count(vim.diagnostic.severity.ERROR)
    if count > 0 then
        local errors_count = string.format('  %s', tostring(count))
        return '%#StatusLineLspError#' .. errors_count .. '%*'
    end

    return ''
end

local function diagnostics_warns()
    if not rawget(vim, 'lsp') then
        return ''
    end

    local count = get_diagnostics_count(vim.diagnostic.severity.WARN)
    if count > 0 then
        local warns_count = string.format('  %s', tostring(count))
        return '%#StatusLineLspWarn#' .. warns_count .. '%*'
    end

    return ''
end

local function diagnostics_hint()
    if not rawget(vim, 'lsp') then
        return ''
    end

    local count = get_diagnostics_count(vim.diagnostic.severity.HINT)
    if count > 0 then
        local hints_count = string.format('  %s', tostring(count))
        return '%#StatusLineLspHint#' .. hints_count .. '%*'
    end

    return ''
end

local function diagnostics_info()
    if not rawget(vim, 'lsp') then
        return ''
    end

    local count = get_diagnostics_count(vim.diagnostic.severity.INFO)
    if count > 0 then
        local infos_count = string.format('  %s', tostring(count))
        return '%#StatusLineLspInfo#' .. infos_count .. '%*'
    end

    return ''
end

local function lsp_messages()
    if not rawget(vim, 'lsp') then
        return ''
    end

    if vim.o.columns < 120 then
        return ''
    end

    local trim = require('config.utils').trim

    local status = vim.lsp.status()
    local message = string.format(' %s', trim(vim.split(status, ',')[1]))

    return '%#StatusLineLspMessages#' .. message .. '%*'
end

local function git_diff(type)
    local gsd = vim.b.gitsigns_status_dict

    if gsd and gsd[type] and gsd[type] > 0 then
        return tostring(gsd[type])
    end

    return ''
end

local function git_diff_added()
    local diff = git_diff 'added'
    if diff == '' then
        return ''
    end

    local added = string.format(' +%s', diff)
    return '%#StatusLineGitDiffAdded#' .. added .. '%*'
end

local function git_diff_changed()
    local diff = git_diff 'changed'
    if diff == '' then
        return ''
    end

    local changed = string.format(' ~%s', diff)
    return '%#StatusLineGitDiffChanged#' .. changed .. '%*'
end

local function git_diff_removed()
    local diff = git_diff 'removed'
    if diff == '' then
        return ''
    end

    local removed = string.format(' -%s', diff)
    return '%#StatusLineGitDiffRemoved#' .. removed .. '%*'
end

local function git_branch()
    if vim.b.gitsigns_head == '' or vim.b.gitsigns_head == nil then
        return ''
    end

    return ' %#StatusLineGitBranchIcon#󰘬%* ' .. vim.b.gitsigns_head
end

local function file_percentage()
    local current_line = vim.api.nvim_win_get_cursor(0)[1]
    local lines = vim.api.nvim_buf_line_count(0)

    return string.format(' %d%%%%', math.ceil(current_line / lines * 100))
end

local function total_lines()
    local lines = vim.fn.line '$'
    local visible_lines = vim.fn.line 'w$'

    if lines <= visible_lines then
        return ''
    end

    return string.format('  %s', lines)
end

local function formatted_filetype()
    local filetype = vim.bo.filetype

    if filetype == '' then
        filetype = vim.fn.expand '%:e'

        if filetype == '' then
            local buf = vim.api.nvim_get_current_buf()
            local bufname = vim.api.nvim_buf_get_name(buf)

            if bufname == vim.loop.cwd() then
                return ' Directory '
            end
        end
    end

    local filetypes = require 'config.statusline.filetypes'

    if filetypes[filetype] == nil then
        return string.format(' %s ', filetypes[''])
    end
    return string.format(' %s ', filetypes[filetype])
end

StatusLine = {}

StatusLine.active = function()
    if vim.o.filetype == 'alpha' then
        return table.concat {
            '%#Normal#',
        }
    end

    local mode_str = vim.api.nvim_get_mode()['mode']
    if mode_str == 't' or mode_str == 'nt' then
        return table.concat {
            '%#Statusline#',
            mode(),
            '%=',
            '%=',
        }
    end

    return table.concat {
        '%#Statusline#',
        mode(),
        python_env(),
        lsp_servers(),
        null_ls(),
        diagnostics_error(),
        diagnostics_warns(),
        diagnostics_hint(),
        diagnostics_info(),
        lsp_messages(),
        '%=',
        '%=',
        -- git_diff_added(),
        -- git_diff_changed(),
        -- git_diff_removed(),
        -- git_branch(),
        file_percentage(),
        total_lines(),
        formatted_filetype(),
    }
end

StatusLine.inactive = function()
    return table.concat {
        '%#Statusline#',
        '%#StatusLineMode#',
        formatted_filetype():upper(),
        '%*',
    }
end

StatusLine.empty = function()
    return table.concat {
        '%#Normal#',
    }
end

local statusline_augroup =
    vim.api.nvim_create_augroup('StatusLine', { clear = true })

vim.api.nvim_create_autocmd({ 'WinEnter', 'BufEnter' }, {
    group = statusline_augroup,
    pattern = { '*' },
    command = 'setlocal statusline=%!v:lua.StatusLine.active()',
})

local inactive_filetypes = {
    'NvimTree_1',
    'qf',
    'TelescopePrompt',
    'lspinfo',
    'lazy',
}

vim.api.nvim_create_autocmd({ 'WinEnter', 'BufEnter', 'FileType' }, {
    group = statusline_augroup,
    pattern = inactive_filetypes,
    command = 'setlocal statusline=%!v:lua.StatusLine.inactive()',
})
