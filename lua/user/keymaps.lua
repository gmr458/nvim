local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "m", ":bnext<CR>", opts)
keymap("n", "z", ":bprevious<CR>", opts)

-- Delete current buffer
keymap("n", "<leader>bd", ":bd!<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", "\"_dP", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Telescope
keymap("n", "tff", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
keymap("n", "tfg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
keymap("n", "<space>fb", ":Telescope file_browser<CR>", { noremap = true })
keymap("n", "<space>mf", ":Telescope media_files<CR>", { noremap = true })

-- Nvim Tree
keymap("n", "<C-n>", ":NvimTreeToggle<CR>", opts)
vim.cmd([[tnoremap <silent> <C-n> <C-\><C-n>:NvimTreeToggle<CR>]])
keymap("n", "<leader>r", ":NvimTreeRefresh<CR>", opts)
keymap("n", "<leader>n", ":NvimTreeFindFile<CR>", opts)

-- nohlsearch
keymap("n", "<Leader>nh", ":nohlsearch<CR>", opts)

-- Toogle terminal
vim.cmd([[nnoremap <silent> <A-d> :ToggleTerm<CR>]])
vim.cmd([[tnoremap <silent> <A-d> <C-\><C-n>:ToggleTerm<CR>]])
