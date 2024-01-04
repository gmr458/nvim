Add 'gmr.plugins.alpha'
Add 'gmr.plugins.autopairs'
Add 'gmr.plugins.autotag'
Add 'gmr.plugins.cloak'
Add 'gmr.plugins.cmp'
Add 'gmr.plugins.colorizer'
-- Add 'gmr.plugins.colorschemes.vscode_modern_theme'
Add 'gmr.plugins.colorschemes.kanagawa'
-- Add 'gmr.plugins.dap'
Add 'gmr.plugins.formatter'
Add 'gmr.plugins.fzf'
Add 'gmr.plugins.gitsigns'
Add 'gmr.plugins.guess-indent'
Add 'gmr.plugins.ibl'
Add 'gmr.plugins.jdtls'
Add 'gmr.plugins.kommentary'
Add 'gmr.plugins.lsp'
Add 'gmr.plugins.mason'
-- Add 'gmr.plugins.navic'
Add 'gmr.plugins.neodev'
Add 'gmr.plugins.neoscroll'
-- Add 'gmr.plugins.neotest'
Add 'gmr.plugins.nvim-tree'
Add 'gmr.plugins.scriptease'
Add 'gmr.plugins.scrollbar'
-- Add 'gmr.plugins.telescope'
Add 'gmr.plugins.treesitter'
-- Add 'gmr.plugins.ufo'
Add 'gmr.plugins.web-devicons'
Add 'gmr.plugins.zen-mode'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

if not vim.uv.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazypath,
    }
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup(PLUGIN_SPECS, {
    ui = {
        border = 'single',
    },
    change_detection = {
        enabled = false,
        notify = false,
    },
})