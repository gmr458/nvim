-- vim.cmd("set whichwrap+=<,>,[,],h,l")
-- vim.cmd([[set iskeyword+=-]])
-- vim.cmd([[set formatoptions-=cro]])

vim.cmd([[
    augroup RestoreCursorShapeOnExit
        autocmd!
        "autocmd VimLeave * set guicursor=a:hor20
        autocmd VimLeave * set guicursor=a:ver1
    augroup END
]])

-- Hide error messages in JSON with comments
vim.cmd("au BufRead,BufNewFile tsconfig.json set filetype=jsonc")

-- Remove symbol ~ in NvimTree
vim.cmd("let &fcs='eob: '")

-- Borders :LspInstallInfo
vim.cmd("autocmd FileType lsp-installer lua vim.api.nvim_win_set_config(0, { border = 'rounded' })")
