local options = {
    background = "dark",
    backspace = "indent,eol,start",
    backup = false,
    -- clipboard = "unnamedplus",
    cmdheight = 1,
    -- colorcolumn = "80",
    completeopt = { "menu", "menuone", "noselect" },
    conceallevel = 0,
    cursorline = true,
    encoding = "UTF-8",
    errorbells = false,
    expandtab = true,
    fileencoding = "UTF-8",
    guifont = "Iosevka Fixed:h12",
    hidden = true,
    hlsearch = true,
    ignorecase = true,
    incsearch = true,
    laststatus = 3,
    mouse = "a",
    number = true,
    -- numberwidth = 2,
    omnifunc = "syntaxcomplete#Complete",
    pumheight = 10,
    relativenumber = false,
    ruler = false,
    scrolloff = 8,
    shiftwidth = 4,
    showmode = false,
    -- showtabline = 4,
    sidescrolloff = 8,
    signcolumn = "yes",
    smartcase = true,
    smartindent = true,
    splitbelow = true,
    splitright = true,
    swapfile = false,
    tabstop = 4,
    termguicolors = true,
    undofile = false,
    updatetime = 300,
    wrap = false,
    writebackup = false,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.opt.shortmess:append("c")
vim.g.vim_json_warnings = false

vim.g.neovide_refresh_rate = 60
vim.g.neovide_fullscreen = true
vim.g.neovide_input_use_logo = true
vim.g.neovide_profiler = false
-- vim.g.neovide_cursor_animation_length = 0.1
-- vim.g.neovide_cursor_trail_length = 0.01
vim.g.neovide_cursor_antialiasing = true

vim.cmd([[
    set clipboard+=unnamedplus
    se mouse+=a

    noremap <C-C> "+y
    noremap <C-V> "+p
    cnoremap <C-V> <C-r>+
    imap <C-V> <C-r>+
    set t_md=
]])
