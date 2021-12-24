-- settings gruvbox
vim.g.gruvbox_bold = false
vim.g.gruvbox_italic = false
vim.g.gruvbox_transparent_bg = false
vim.g.gruvbox_underline = false
vim.g.gruvbox_undercurl = false
vim.g.gruvbox_contrast_dark = "hard"
vim.g.gruvbox_contrast_light = "hard"
vim.g.gruvbox_italicize_comments = false
vim.g.gruvbox_italicize_strings = false

vim.cmd([[
    try
        colorscheme gruvbox
    catch /^Vim\%((\a\+)\)\=:E185/
        colorscheme default
        set background=dark
    endtry
]])
