--- @type boolean true when running inside Kitty terminal.
local running_kitty = os.getenv 'TERM' == 'xterm-kitty'

local kitty = require 'gmr.configs.kitty'

vim.keymap.set('n', '<C-h>', running_kitty and function()
    kitty.nav 'h'
end or '<C-w>h', { desc = 'Move the cursor to the window on the left' })
vim.keymap.set('n', '<C-j>', running_kitty and function()
    kitty.nav 'j'
end or '<C-w>j', { desc = 'Move the cursor to the window below' })
vim.keymap.set('n', '<C-k>', running_kitty and function()
    kitty.nav 'k'
end or '<C-w>k', { desc = 'Move the cursor to the window above' })
vim.keymap.set('n', '<C-l>', running_kitty and function()
    kitty.nav 'l'
end or '<C-w>l', { desc = 'Move the cursor to the window on the right' })

vim.keymap.set(
    'n',
    '<C-Up>',
    ':resize -2<cr>',
    { silent = true, desc = 'Resize window vertically' }
)
vim.keymap.set(
    'n',
    '<C-Down>',
    ':resize +2<cr>',
    { silent = true, desc = 'Resize window vertically' }
)
vim.keymap.set(
    'n',
    '<C-Left>',
    ':vertical resize -2<cr>',
    { silent = true, desc = 'Resize window horizontally' }
)
vim.keymap.set(
    'n',
    '<C-Right>',
    ':vertical resize +2<cr>',
    { silent = true, desc = 'Resize window horizontally' }
)
