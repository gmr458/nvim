vim.g.mapleader = ' '

-- normal
vim.keymap.set(
    'n',
    '<C-h>',
    '<C-w>h',
    { desc = 'Move the cursor to the window on the left' }
)
vim.keymap.set(
    'n',
    '<C-j>',
    '<C-w>j',
    { desc = 'Move the cursor to the window below' }
)
vim.keymap.set(
    'n',
    '<C-k>',
    '<C-w>k',
    { desc = 'Move the cursor to the window above' }
)
vim.keymap.set(
    'n',
    '<C-l>',
    '<C-w>l',
    { desc = 'Move the cursor to the window on the right' }
)

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

vim.keymap.set(
    'n',
    '<leader>bd',
    ':bd!<cr>',
    { silent = true, desc = 'Delete current buffer' }
)

-- if vim.uv.os_uname().sysname == 'Windows_NT' then
--     vim.keymap.set(
--         'n',
--         '<leader>ff',
--         ':Telescope find_files<cr>',
--         { silent = true }
--     )
--     vim.keymap.set(
--         'n',
--         '<leader>gs',
--         ':Telescope git_status<cr>',
--         { silent = true }
--     )
--     vim.keymap.set(
--         'n',
--         '<leader>lg',
--         ':Telescope live_grep<cr>',
--         { silent = true }
--     )
--     vim.keymap.set(
--         'n',
--         '<leader>hh',
--         ':Telescope help_tags<cr>',
--         { silent = true }
--     )
--     vim.keymap.set(
--         'n',
--         '<leader>of',
--         ':Telescope oldfiles<cr>',
--         { silent = true }
--     )
--     vim.keymap.set(
--         'n',
--         '<leader>bf',
--         ':Telescope buffers<cr>',
--         { silent = true }
--     )
-- else
local function get_fzf_opts()
    return {
        winopts = {
            preview = {
                hidden = 'hidden',
            },
        },
        fzf_opts = { ['--color'] = vim.o.background .. ',bg+:-1' },
    }
end

vim.keymap.set('n', '<leader>ff', function()
    require('fzf-lua').files(get_fzf_opts())
end, { silent = true })
vim.keymap.set('n', '<leader>gs', function()
    require('fzf-lua').git_status {
        winopts = {
            fullscreen = true,
        },
    }
end, { silent = true })
vim.keymap.set(
    'n',
    '<leader>lg',
    ':FzfLua live_grep resume=true<cr>',
    { silent = true }
)
vim.keymap.set('n', '<leader>hh', function()
    require('fzf-lua').help_tags {
        winopts = {
            preview = {
                layout = 'horizontal',
            },
            fullscreen = true,
        },
        resume = true,
    }
end, { silent = true })
vim.keymap.set('n', '<leader>of', function()
    require('fzf-lua').oldfiles(get_fzf_opts())
end, { silent = true })
vim.keymap.set('n', '<leader>bf', function()
    require('fzf-lua').buffers(get_fzf_opts())
end, { silent = true })
-- end

vim.keymap.set(
    'n',
    '<leader>gp',
    ':Gitsigns preview_hunk<cr>',
    { silent = true }
)

vim.keymap.set('n', '<C-n>', ':NvimTreeFindFileToggle<cr>', { silent = true })
vim.keymap.set('n', '<leader>r', ':NvimTreeRefresh<cr>', { silent = true })

vim.keymap.set('n', '<leader>nh', ':nohlsearch<cr>', { silent = true })

vim.keymap.set(
    'n',
    '<leader>sq',
    'ciw\'<C-r>"\'<esc>',
    { silent = true, noremap = true, desc = 'Insert single quotes' }
)
vim.keymap.set(
    'n',
    '<leader>usq',
    'di\'hPl2x',
    { silent = true, noremap = true, desc = 'Remove single quotes' }
)

vim.keymap.set(
    'n',
    '<leader>dq',
    'ciw"<C-r>""<esc>',
    { silent = true, noremap = true, desc = 'Insert double quotes' }
)
vim.keymap.set(
    'n',
    '<leader>udq',
    'di"hPl2x',
    { silent = true, noremap = true, desc = 'Remove double quotes' }
)

vim.keymap.set('v', '<leader>sq', 'xi\'<esc>pA\'<esc>', {
    silent = true,
    noremap = true,
    desc = 'Insert single quotes in visual mode',
})
vim.keymap.set('v', '<leader>dq', 'xi"<esc>pA"<esc>', {
    silent = true,
    noremap = true,
    desc = 'Insert double quotes in visual mode',
})

vim.keymap.set('n', 'x', '"_x', { desc = 'Dot not yank with x' })

vim.keymap.set('n', '<C-a>', 'gg<S-v>G', { desc = 'Select all' })

vim.keymap.set('n', '<leader>fc', '<cmd>foldclose<cr>')

vim.keymap.set(
    { 'n', 'v' },
    '<leader>y',
    [["+y]],
    { desc = 'Yank to clipboard' }
)
vim.keymap.set('n', '<leader>Y', [["+Y]], { desc = 'Yank to clipboard' })

vim.keymap.set('n', '<leader>sb', function()
    vim.opt.background = vim.o.background == 'dark' and 'light' or 'dark'
end, { desc = 'Switch background' })

vim.keymap.set('n', '<leader>ct', '<cmd>ColorizerToggle<cr>')

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

vim.keymap.set('n', '<leader>ch', function()
    vim.opt.cmdheight = vim.o.cmdheight == 0 and 1 or 0
end, { silent = true, desc = 'Switch cmdheight between 1 and 0' })

vim.keymap.set(
    { 'n', 'o', 'x' },
    '<s-h>',
    '^',
    { desc = 'Move cursor to the first character of the current line' }
)
vim.keymap.set(
    { 'n', 'o', 'x' },
    '<s-l>',
    'g_',
    { desc = 'Move cursor to the last character of the current line' }
)

-- insert
vim.keymap.set('i', 'jk', '<esc>', { desc = 'Use jk to enter in normal mode' })

-- visual
vim.keymap.set('v', '<', '<gv', { desc = 'Stay in indent mode' })
vim.keymap.set('v', '>', '>gv', { desc = 'Stay in indent mode' })

vim.keymap.set('v', 'p', '"_dP', {
    noremap = true,
    silent = true,
    desc = 'Remember copied elements when pasted in visual mode',
})

-- terminal
vim.keymap.set(
    't',
    'jk',
    '<C-\\><C-n>',
    { desc = 'Use jk to enter in terminal normal mode' }
)
