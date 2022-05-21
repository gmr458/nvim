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
        call gruvbox_material#highlight('TSStringNamespace', l:palette.green, l:palette.none)
        call gruvbox_material#highlight('goTSNamespace', l:palette.aqua, l:palette.none)
        call gruvbox_material#highlight('goTSProperty', l:palette.blue, l:palette.none)
        call gruvbox_material#highlight('DiagnosticError', l:palette.red, l:palette.none)
        call gruvbox_material#highlight('DiagnosticFloatingError', l:palette.red, l:palette.bg0)
        call gruvbox_material#highlight('DiagnosticVirtualTextError', l:palette.red, l:palette.none)
        call gruvbox_material#highlight('DiagnosticWarn', l:palette.yellow, l:palette.none)
        call gruvbox_material#highlight('DiagnosticFloatingWarn', l:palette.yellow, l:palette.bg0)
        call gruvbox_material#highlight('DiagnosticVirtualTextWarn', l:palette.yellow, l:palette.none)
        call gruvbox_material#highlight('DiagnosticInfo', l:palette.blue, l:palette.none)
        call gruvbox_material#highlight('DiagnosticFloatingInfo', l:palette.blue, l:palette.bg0)
        call gruvbox_material#highlight('DiagnosticVirtualTextInfo', l:palette.blue, l:palette.none)
        call gruvbox_material#highlight('DiagnosticHint', l:palette.aqua, l:palette.none)
        call gruvbox_material#highlight('DiagnosticFloatingHint', l:palette.aqua, l:palette.bg0)
        call gruvbox_material#highlight('DiagnosticVirtualTextHint', l:palette.aqua, l:palette.none)
        call gruvbox_material#highlight('NvimTreeWinSeparator', l:palette.bg0, l:palette.bg0)
    endfunction

    augroup GruvboxMaterialCustom
        autocmd!
        autocmd ColorScheme gruvbox-material call s:gruvbox_material_custom()
    augroup END

    colorscheme gruvbox-material
]])
