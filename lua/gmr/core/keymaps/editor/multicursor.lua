vim.keymap.set(
    'n',
    '<C-Q>',
    '<Cmd>nohlsearch<Bar>diffupdate'
        .. '<Bar>call nvim_buf_clear_namespace(0, nvim_create_namespace("nvim.multicursor"), 0, -1)'
        .. '<Bar>normal! <C-L><CR>',
    { desc = 'Clears multicursors in the current buffer' }
)
