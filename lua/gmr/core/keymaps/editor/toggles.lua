--- @type boolean true when running inside Kitty terminal.
local running_kitty = os.getenv 'TERM' == 'xterm-kitty'

vim.keymap.set('n', '<leader>sb', function()
    vim.opt.background = vim.o.background == 'dark' and 'light' or 'dark'
    if running_kitty and vim.g.neovide == nil then
        local cmd = 'kitten themes --cache-age=-1 '
            .. 'cold_'
            .. vim.o.background
        vim.fn.system(cmd)
    end
end, { desc = 'Switch background' })

vim.keymap.set('n', '<leader>sw', function()
    if vim.o.wrap then
        vim.cmd 'set nowrap'
    else
        vim.cmd 'set wrap'
    end
end, { desc = 'Switch wrap' })

vim.keymap.set('n', '<leader>ch', function()
    vim.opt.cmdheight = vim.o.cmdheight == 0 and 1 or 0
end, { silent = true, desc = 'Switch cmdheight between 1 and 0' })
