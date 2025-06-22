vim.keymap.set('v', '<leader>l', function()
    local esc = vim.api.nvim_replace_termcodes('<Esc>', true, true, true)
    local keys = 'yoConsole.WriteLine("'
        .. esc
        .. 'pA:", '
        .. esc
        .. 'pA);'
        .. esc
    return vim.fn.feedkeys(keys, 'n')
end, {
    desc = 'Console.WriteLine() for text selected in visual mode',
    buffer = true,
    noremap = true,
})
