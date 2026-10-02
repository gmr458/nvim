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

--- @type integer | nil
local terminal_buf = nil
--- @type integer | nil
local terminal_win_id = nil

--- Opens the terminal in a horizontal split, or brings it back
--- into view if it already exists but is hidden.
local function open_terminal()
    if terminal_buf == nil or vim.fn.bufexists(terminal_buf) ~= 1 then
        vim.cmd 'split | term'
        terminal_win_id = vim.fn.win_getid()
        terminal_buf = vim.fn.bufnr '%'
    elseif
        terminal_win_id == nil or vim.fn.win_gotoid(terminal_win_id) ~= 1
    then
        vim.cmd('sb ' .. terminal_buf)
        terminal_win_id = vim.fn.win_getid()
    end

    vim.cmd 'startinsert'
end

--- Hides the terminal window if it is currently visible.
local function hide_terminal()
    if terminal_win_id ~= nil and vim.fn.win_gotoid(terminal_win_id) == 1 then
        vim.cmd 'hide'
    end
end

--- Toggles the terminal window visibility.
local function toggle_terminal()
    if terminal_win_id ~= nil and vim.fn.win_gotoid(terminal_win_id) == 1 then
        hide_terminal()
    else
        open_terminal()
    end
end

vim.keymap.set({ 'n', 't' }, '<A-d>', toggle_terminal, {
    desc = 'toggle terminal',
})
