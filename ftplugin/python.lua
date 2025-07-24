local esc = vim.api.nvim_replace_termcodes('<Esc>', true, true, true)
local lhs_print = 'yoprint("' .. esc .. 'pA:", ' .. esc .. 'pA)' .. esc

vim.keymap.set('v', '<leader>l', lhs_print, {
    desc = 'print() for text selected in visual mode',
    buffer = true,
    noremap = true,
})
