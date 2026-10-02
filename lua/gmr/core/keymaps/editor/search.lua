vim.keymap.set(
    'n',
    '<leader>nh',
    ':nohlsearch<cr>',
    { silent = true, desc = 'Don\'t highlight the current search' }
)

vim.keymap.set(
    'x',
    '/',
    '<Esc>/\\%V',
    { desc = 'Search within visual selection' }
)
