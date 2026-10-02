vim.keymap.set(
    'n',
    'ci_',
    'F_lvf_hc',
    { silent = true, noremap = true, desc = 'Delete word between underscores' }
)

vim.keymap.set(
    'n',
    'ci-',
    'F-lvf-hc',
    { silent = true, noremap = true, desc = 'Delete word between hyphens' }
)

vim.keymap.set(
    'n',
    'ci.',
    'F.lvf.hc',
    { silent = true, noremap = true, desc = 'Delete word between dots' }
)

vim.keymap.set(
    'n',
    'ci<',
    'F>lvf<hc',
    { silent = true, noremap = true, desc = 'Delete word between tags' }
)

vim.keymap.set('i', 'jk', '<esc>', { desc = 'Use jk to enter in normal mode' })

vim.keymap.set('n', 'x', '"_x', { desc = 'Dot not yank with x' })

vim.keymap.set('n', '<C-a>', 'gg<S-v>G', { desc = 'Select all' })

vim.keymap.set('n', '<leader>fc', '<cmd>foldclose<cr>')

vim.keymap.set('v', '<', '<gv', { desc = 'Stay in indent mode' })
vim.keymap.set('v', '>', '>gv', { desc = 'Stay in indent mode' })

vim.keymap.set('v', 'p', '"_dP', {
    noremap = true,
    silent = true,
    desc = 'Remember copied elements when pasted in visual mode',
})

vim.keymap.set('n', 'dd', function()
    if vim.fn.getline('.'):match '^%s*$' then
        return '"_dd'
    end
    return 'dd'
end, { expr = true, desc = 'Yank the line on `dd` only if it is non-empty' })
