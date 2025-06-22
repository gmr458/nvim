local esc = vim.api.nvim_replace_termcodes('<Esc>', true, true, true)
local lhs_print = 'yostd.debug.print("'
    .. esc
    .. 'pA: {}\\n", .{'
    .. esc
    .. 'pA});'
    .. esc

vim.keymap.set('v', '<leader>l', lhs_print, {
    desc = 'println!() for text selected in visual mode',
    buffer = true,
    noremap = true,
})
