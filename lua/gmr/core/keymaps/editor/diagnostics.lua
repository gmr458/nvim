vim.keymap.set('n', '<leader>dd', function()
    vim.diagnostic.setloclist()
end, { desc = 'Show buffer diagnostics' })

vim.keymap.set('n', '<leader>wd', function()
    vim.diagnostic.setqflist()
end, { desc = 'Show workspace diagnostics' })
