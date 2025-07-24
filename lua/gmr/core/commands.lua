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
