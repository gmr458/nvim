vim.api.nvim_create_user_command('CopyCurrentFilename', function()
    local filename = vim.fn.expand '%:.'
    if filename == '' then
        return
    end
    vim.fn.system('echo -n ' .. filename .. ' | wl-copy')
    vim.notify(filename .. ' copied', vim.log.levels.INFO)
end, {})
