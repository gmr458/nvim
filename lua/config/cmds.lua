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
-- vim.cmd("hi SignColumn guibg=none")
-- vim.cmd([[set fillchars+=vert:\ ]])
-- vim.cmd(
--     [[autocmd BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if bufname('%') == "NvimTree_1" | set laststatus=0 | elseif bufname('%') == "" | set laststatus=0 | elseif &filetype == "toggleterm" | set laststatus=0 | else | set laststatus=3 | endif]]
-- )
