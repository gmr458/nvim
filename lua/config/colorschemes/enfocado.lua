local feline_loaded, feline = pcall(require, "feline")

if not feline_loaded then
    print("feline not loaded")
    return
end

feline.setup({
    force_inactive = {
        filetypes = {
            "^NvimTree$",
            "^packer$",
            "^startify$",
            "^fugitive$",
            "^fugitiveblame$",
            "^qf$",
            "^help$",
            "^TelescopePrompt$",
            "^alpha$",
            "^lsp%-installer$",
            "^lspinfo$",
        },
        buftypes = {
            "^terminal$",
        },
        bufnames = {},
    },
    disable = { filetypes = { "^alpha$" } },
    theme = require("config.feline.themes.enfocado").palette(),
    components = require("config.feline.themes.enfocado").components(),
})

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
            " Float windows
            autocmd ColorScheme enfocado highlight NormalFloat guibg=#121212
            autocmd ColorScheme enfocado highlight FloatBorder guibg=#121212 guifg=#121212

            " Diagnostic floating windows
            autocmd ColorScheme enfocado highlight DiagnosticFloatingError guibg=#121212
            autocmd ColorScheme enfocado highlight DiagnosticFloatingHint guibg=#121212
            autocmd ColorScheme enfocado highlight DiagnosticFloatingInfo guibg=#121212
            autocmd ColorScheme enfocado highlight DiagnosticFloatingWarn guibg=#121212
            autocmd ColorScheme enfocado highlight DiagnosticVirtualTextError guibg=#181818
            autocmd ColorScheme enfocado highlight DiagnosticVirtualTextError guibg=#181818 guifg=#ED4A46
            autocmd ColorScheme enfocado highlight DiagnosticVirtualTextHint guibg=#181818 guifg=#368AEB
            autocmd ColorScheme enfocado highlight DiagnosticVirtualTextInfo guibg=#181818 guifg=#DBB32D
            autocmd ColorScheme enfocado highlight DiagnosticVirtualTextWarn guibg=#181818 guifg=#E67F43

            " Statusline
            autocmd ColorScheme enfocado highlight StatusLine guibg=#181818

            " Telescope
            autocmd ColorScheme enfocado highlight TelescopeBorder guibg=#121212 guifg=#121212
            autocmd ColorScheme enfocado highlight TelescopeMultiSelection guibg=#121212
            autocmd ColorScheme enfocado highlight TelescopeNormal guibg=#121212
            autocmd ColorScheme enfocado highlight TelescopePreviewBorder guibg=#121212 guifg=#121212
            autocmd ColorScheme enfocado highlight TelescopePreviewNormal guibg=#121212
            autocmd ColorScheme enfocado highlight TelescopePreviewTitle guibg=#121212 guifg=#777777
            autocmd ColorScheme enfocado highlight TelescopePromptBorder guibg=#121212 guifg=#121212
            autocmd ColorScheme enfocado highlight TelescopePromptNormal guibg=#121212
            autocmd ColorScheme enfocado highlight TelescopePromptTitle guibg=#121212 guifg=#777777
            autocmd ColorScheme enfocado highlight TelescopeResultsBorder guibg=#121212 guifg=#121212
            autocmd ColorScheme enfocado highlight TelescopeResultsNormal guibg=#121212
            autocmd ColorScheme enfocado highlight TelescopeResultsTitle guifg=#777777
            autocmd ColorScheme enfocado highlight TelescopeSelection guibg=#121212 guifg=#368AEB

            " NvimTree
            autocmd ColorScheme enfocado highlight NvimTreeNormal guibg=#0D0D0D
            autocmd ColorScheme enfocado highlight! link NvimTreeNormalNC NvimTreeNormal
            autocmd ColorScheme enfocado highlight NvimTreeWinSeparator guibg=#181818 guifg=#181818

            " Toggle Term
            autocmd ColorScheme enfocado highlight ToggleTerm1NormalFloat guibg=#121212
            autocmd ColorScheme enfocado highlight ToggleTerm1FloatBorder guibg=#121212 guifg=#121212

            " TreesitterContext
            autocmd ColorScheme enfocado highlight TreesitterContext guibg=#121212
            autocmd ColorScheme enfocado highlight TreesitterContextLineNumber guibg=#121212
    augroup END

    colorscheme enfocado
]])
