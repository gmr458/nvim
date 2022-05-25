vim.cmd([[
    let g:enfocado_style = "neture" " Available: nature or neon

    let g:enfocado_plugins = [
        \ 'cmp',
        \ 'lsp',
        \ 'lsp-installer',
        \ 'packer',
        \ 'rainbow',
        \ 'telescope',
        \ 'tree',
        \ 'treesitter'
    \ ]

    augroup enfocado_customization
        autocmd!
            autocmd ColorScheme enfocado highlight NormalFloat guibg=#181818
            autocmd ColorScheme enfocado highlight FloatBorder guibg=#181818
            autocmd ColorScheme enfocado highlight DiagnosticFloatingError guibg=#181818
            autocmd ColorScheme enfocado highlight DiagnosticFloatingHint guibg=#181818
            autocmd ColorScheme enfocado highlight DiagnosticFloatingInfo guibg=#181818
            autocmd ColorScheme enfocado highlight DiagnosticFloatingWarn guibg=#181818
            autocmd ColorScheme enfocado highlight StatusLine guibg=#181818
            autocmd ColorScheme enfocado highlight TelescopeSelection guibg=#181818 guifg=#368AEB
            autocmd ColorScheme enfocado highlight TelescopeMultiSelection guibg=#181818
            autocmd ColorScheme enfocado highlight NvimTreeNormal guibg=#0D0D0D
            autocmd ColorScheme enfocado highlight! link NvimTreeNormalNC NvimTreeNormal
            autocmd ColorScheme enfocado highlight NvimTreeWinSeparator guibg=#181818 guifg=#181818
    augroup END

    colorscheme enfocado
]])
