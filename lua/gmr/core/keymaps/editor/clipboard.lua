vim.keymap.set(
    { 'n', 'v' },
    '<leader>y',
    [["+y]],
    { desc = 'Yank to clipboard' }
)
vim.keymap.set('n', '<leader>Y', [["+Y]], { desc = 'Yank to clipboard' })
