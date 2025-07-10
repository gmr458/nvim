vim.api.nvim_create_user_command('CopyCurrentFilename', function()
    local filename = vim.fn.expand '%:.'
    if filename == '' then
        return
    end
    filename = filename:gsub('([%[%]])', '\\%1') -- escape [ and ]
    vim.fn.system('echo -n ' .. filename .. ' | wl-copy')
    vim.notify(filename .. ' copied', vim.log.levels.INFO)
end, {})
