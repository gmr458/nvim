vim.api.nvim_create_user_command('CopyCurrentFilename', function()
    local filename = vim.fn.expand '%:.'
    if filename == '' then
        return
    end
    filename = filename:gsub('([%[%]])', '\\%1') -- escape [ and ]
    vim.fn.system('echo -n ' .. filename .. ' | wl-copy')
    vim.notify(filename .. ' copied', vim.log.levels.INFO)
end, {})

vim.api.nvim_create_user_command('DeleteAllBuffers', function()
    local bufs = vim.api.nvim_list_bufs()
    vim.cmd('bdelete ' .. table.concat(bufs, ' '))
end, {})
