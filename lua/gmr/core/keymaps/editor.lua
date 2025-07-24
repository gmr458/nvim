local running_kitty = os.getenv 'TERM' == 'xterm-kitty'

local kitty = require 'gmr.configs.kitty'

-- move cursor between windows
vim.keymap.set('n', '<C-h>', running_kitty and function()
    kitty.nav 'h'
end or '<C-w>h', { desc = 'Move the cursor to the window on the left' })
vim.keymap.set('n', '<C-j>', running_kitty and function()
    kitty.nav 'j'
end or '<C-w>j', { desc = 'Move the cursor to the window below' })
vim.keymap.set('n', '<C-k>', running_kitty and function()
    kitty.nav 'k'
end or '<C-w>k', { desc = 'Move the cursor to the window above' })
vim.keymap.set('n', '<C-l>', running_kitty and function()
    kitty.nav 'l'
end or '<C-w>l', { desc = 'Move the cursor to the window on the right' })

-- resize
vim.keymap.set(
    'n',
    '<C-Up>',
    ':resize -2<cr>',
    { silent = true, desc = 'Resize window vertically' }
)
vim.keymap.set(
    'n',
    '<C-Down>',
    ':resize +2<cr>',
    { silent = true, desc = 'Resize window vertically' }
)
vim.keymap.set(
    'n',
    '<C-Left>',
    ':vertical resize -2<cr>',
    { silent = true, desc = 'Resize window horizontally' }
)
vim.keymap.set(
    'n',
    '<C-Right>',
    ':vertical resize +2<cr>',
    { silent = true, desc = 'Resize window horizontally' }
)

-- buffers
vim.keymap.set(
    'n',
    '<leader>bd',
    ':bd!<cr>',
    { silent = true, desc = 'Delete current buffer' }
)

-- diagnostics
vim.keymap.set('n', '<leader>dd', function()
    vim.diagnostic.setloclist()
end, { desc = 'Show buffer diagnostics' })

vim.keymap.set('n', '<leader>wd', function()
    vim.diagnostic.setqflist()
end, { desc = 'Show workspace diagnostics' })

-- search
vim.keymap.set(
    'n',
    '<leader>nh',
    ':nohlsearch<cr>',
    { silent = true, desc = 'Don\'t highlight the current search' }
)

-- insert and remove quotes
-- vim.keymap.set(
--     'n',
--     '<leader>sq',
--     'ciw\'<C-r>"\'<esc>',
--     { silent = true, noremap = true, desc = 'Insert single quotes' }
-- )
-- vim.keymap.set(
--     'n',
--     '<leader>usq',
--     'di\'hPl2x',
--     { silent = true, noremap = true, desc = 'Remove single quotes' }
-- )
-- vim.keymap.set(
--     'n',
--     '<leader>dq',
--     'ciw"<C-r>""<esc>',
--     { silent = true, noremap = true, desc = 'Insert double quotes' }
-- )
-- vim.keymap.set(
--     'n',
--     '<leader>udq',
--     'di"hPl2x',
--     { silent = true, noremap = true, desc = 'Remove double quotes' }
-- )
-- vim.keymap.set('v', '<leader>sq', 'xi\'<esc>pA\'<esc>', {
--     silent = true,
--     noremap = true,
--     desc = 'Insert single quotes in visual mode',
-- })
-- vim.keymap.set('v', '<leader>dq', 'xi"<esc>pA"<esc>', {
--     silent = true,
--     noremap = true,
--     desc = 'Insert double quotes in visual mode',
-- })

-- simulate ci{ ci( ci' ci" with _ - and .
vim.keymap.set(
    'n',
    'ci_',
    'F_lvf_hc',
    { silent = true, noremap = true, desc = 'Delete word between underscores' }
)

vim.keymap.set(
    'n',
    'ci-',
    'F-lvf-hc',
    { silent = true, noremap = true, desc = 'Delete word between hyphens' }
)

vim.keymap.set(
    'n',
    'ci.',
    'F.lvf.hc',
    { silent = true, noremap = true, desc = 'Delete word between dots' }
)

vim.keymap.set(
    'n',
    'ci<',
    'F>lvf<hc',
    { silent = true, noremap = true, desc = 'Delete word between tags' }
)

-- clipboard
vim.keymap.set(
    { 'n', 'v' },
    '<leader>y',
    [["+y]],
    { desc = 'Yank to clipboard' }
)
vim.keymap.set('n', '<leader>Y', [["+Y]], { desc = 'Yank to clipboard' })

-- switch
vim.keymap.set('n', '<leader>sb', function()
    vim.opt.background = vim.o.background == 'dark' and 'light' or 'dark'
    if running_kitty and vim.g.neovide == nil then
        local cmd = 'kitten themes --cache-age=-1 '
            .. 'cold_'
            .. vim.o.background
        vim.fn.system(cmd)
    end
end, { desc = 'Switch background' })

vim.keymap.set('n', '<leader>sw', function()
    if vim.o.wrap then
        vim.cmd 'set nowrap'
    else
        vim.cmd 'set wrap'
    end
end, { desc = 'Switch wrap' })

vim.keymap.set('n', '<leader>ch', function()
    vim.opt.cmdheight = vim.o.cmdheight == 0 and 1 or 0
end, { silent = true, desc = 'Switch cmdheight between 1 and 0' })

-- terminal
vim.keymap.set(
    'n',
    '<leader>vt',
    [[<cmd>vsplit | term<cr>A]],
    { desc = 'Open terminal in vertical split' }
)
vim.keymap.set(
    'n',
    '<leader>ht',
    [[<cmd>split | term<cr>A]],
    { desc = 'Open terminal in horizontal split' }
)
vim.keymap.set(
    't',
    'jk',
    '<C-\\><C-n>',
    { desc = 'Use jk to enter in terminal normal mode' }
)

-- better space
vim.keymap.set('i', 'jk', '<esc>', { desc = 'Use jk to enter in normal mode' })

-- useful stuff
vim.keymap.set('n', 'x', '"_x', { desc = 'Dot not yank with x' })

vim.keymap.set('n', '<C-a>', 'gg<S-v>G', { desc = 'Select all' })

vim.keymap.set('n', '<leader>fc', '<cmd>foldclose<cr>')

vim.keymap.set('v', '<', '<gv', { desc = 'Stay in indent mode' })
vim.keymap.set('v', '>', '>gv', { desc = 'Stay in indent mode' })

vim.keymap.set('v', 'p', '"_dP', {
    noremap = true,
    silent = true,
    desc = 'Remember copied elements when pasted in visual mode',
})

local terminal_buf = nil
local terminal_win_id = nil

local function open_terminal()
    if vim.fn.bufexists(terminal_buf) ~= 1 then
        vim.cmd 'split | term'
        terminal_win_id = vim.fn.win_getid()
        terminal_buf = vim.fn.bufnr '%'
    elseif vim.fn.win_gotoid(terminal_win_id) ~= 1 then
        vim.cmd('sb ' .. terminal_buf)
        terminal_win_id = vim.fn.win_getid()
    end

    vim.cmd 'startinsert'
end

local function hide_terminal()
    if vim.fn.win_gotoid(terminal_win_id) == 1 then
        vim.cmd 'hide'
    end
end

local function toggle_terminal()
    if vim.fn.win_gotoid(terminal_win_id) == 1 then
        hide_terminal()
    else
        open_terminal()
    end
end

vim.keymap.set({ 'n', 't' }, '<A-d>', toggle_terminal, {
    desc = 'toggle terminal',
})

vim.keymap.set('n', 'dd', function()
    if vim.fn.getline('.'):match '^%s*$' then
        return '"_dd'
    end
    return 'dd'
end, { expr = true, desc = 'Yank the line on `dd` only if it is non-empty' })

vim.keymap.set(
    'x',
    '/',
    '<Esc>/\\%V',
    { desc = 'Search within visual selection' }
)
