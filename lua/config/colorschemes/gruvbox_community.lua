vim.g.gruvbox_contrast_dark = "hard"
vim.g.gruvbox_contrast_light = "hard"
vim.g.gruvbox_sign_column = "bg0"

vim.cmd([[
    function! s:gruvbox_custom() abort
        highlight! link FloatBorder Normal
        highlight! link NormalFloat Normal
    endfunction

    augroup GruvboxCustom
        autocmd!
        autocmd ColorScheme gruvbox call s:gruvbox_custom()
    augroup END

    colorscheme gruvbox
]])
