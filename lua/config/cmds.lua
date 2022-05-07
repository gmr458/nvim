vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])
vim.cmd([[set formatoptions-=cro]])
vim.cmd([[
    augroup RestoreCursorShapeOnExit
        autocmd!
        autocmd VimLeave * set guicursor=a:hor20
    augroup END
]])
vim.cmd("au BufRead,BufNewFile tsconfig.json set filetype=jsonc")
vim.cmd("let &fcs='eob: '")
