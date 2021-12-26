local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
    return
end

toggleterm.setup({
    direction = "float",
})

function _G.set_terminal_keymaps()
    local opts = { noremap = true }
    vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

local Terminal = require("toggleterm.terminal").Terminal

local opts = { noremap = true, silent = true }

local close_terminal = function(term)
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", opts)
end

local node = Terminal:new({
    cmd = "node",
    hidden = true,
    on_open = function(term)
        close_terminal(term)
    end,
})

function _NODE_TOGGLE()
    node:toggle()
end

local deno = Terminal:new({
    cmd = "deno repl",
    hidden = true,
    on_open = function(term)
        close_terminal(term)
    end,
})

function _DENO_TOGGLE()
    deno:toggle()
end

local btop = Terminal:new({
    cmd = "btop",
    hidden = true,
    on_open = function(term)
        close_terminal(term)
    end,
})

function _BTOP_TOGGLE()
    btop:toggle()
end

local python = Terminal:new({
    cmd = "python3",
    hidden = true,
    on_open = function(term)
        close_terminal(term)
    end,
})

function _PYTHON_TOGGLE()
    python:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>node", "<cmd>lua _NODE_TOGGLE()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>deno", "<cmd>lua _DENO_TOGGLE()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>btop", "<cmd>lua _BTOP_TOGGLE()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>py", "<cmd>lua _PYTHON_TOGGLE()<CR>", opts)
