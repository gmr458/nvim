vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_palette = "original"
vim.g.gruvbox_material_background = "hard"
vim.g.gruvbox_material_sign_column_background = "none"

vim.cmd([[
    function! s:gruvbox_material_custom() abort
        " Link a highlight group to a predefined highlight group.
        " See `colors/gruvbox-material.vim` for all predefined highlight groups.
        highlight! link FloatBorder Normal
        highlight! link NormalFloat Normal
    

        " Initialize the color palette.
        " The first parameter is a valid value for `g:gruvbox_material_background`,
        " and the second parameter is a valid value for `g:gruvbox_material_palette`.
        let l:palette = gruvbox_material#get_palette('hard', 'original')
        " Define a highlight group.
        " The first parameter is the name of a highlight group,
        " the second parameter is the foreground color,
        " the third parameter is the background color,
        " the fourth parameter is for UI highlighting which is optional,
        " and the last parameter is for `guisp` which is also optional.
        " See `autoload/gruvbox_material.vim` for the format of `l:palette`.
        call gruvbox_material#highlight('StatusLine', l:palette.bg0, l:palette.none)
        call gruvbox_material#highlight('NvimTreeGitIgnored', l:palette.grey0, l:palette.none, 'bold')
    endfunction

    augroup GruvboxMaterialCustom
        autocmd!
        autocmd ColorScheme gruvbox-material call s:gruvbox_material_custom()
    augroup END

    colorscheme gruvbox-material
]])
