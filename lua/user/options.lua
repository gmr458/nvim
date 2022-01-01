local options = {
    background = "dark",
    backspace = "indent,eol,start",
    backup = false,
    clipboard = "unnamedplus",
    cmdheight = 2,
    completeopt = { "menuone", "noselect" },
    conceallevel = 0,
    cursorline = true,
    encoding = "UTF-8",
    errorbells = false,
    expandtab = true,
    fileencoding = "UTF-8",
    -- guifont = "monospace:h17",
    hidden = true,
    hlsearch = true,
    ignorecase = true,
    incsearch = true,
    mouse = "a",
    number = true,
    numberwidth = 2,
    omnifunc = "syntaxcomplete#Complete",
    pumheight = 10,
    relativenumber = true,
    ruler = false,
    scrolloff = 8,
    shiftwidth = 4,
    showmode = false,
    showtabline = 4,
    sidescrolloff = 8,
    -- signcolumn = "yes",
    smartcase = true,
    smartindent = true,
    splitbelow = true,
    splitright = true,
    swapfile = false,
    tabstop = 4,
    termguicolors = true,
    undofile = true,
    updatetime = 300,
    wrap = false,
    writebackup = false,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.opt.shortmess:append("c")

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
vim.g.vim_json_warnings = false
