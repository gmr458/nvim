local plugin_specs = {} --- @type LazySpecImport[]

--- @param plugin string
local function add(plugin)
    local spec = { import = plugin } --- @type LazySpecImport
    table.insert(plugin_specs, spec)
end

add 'gmr.plugins.autopairs'
add 'gmr.plugins.autotag'
-- add 'gmr.plugins.base46'
add 'gmr.plugins.blink-cmp'
-- add 'gmr.plugins.cloak'
add 'gmr.plugins.colorizer'
add 'gmr.plugins.colorschemes.vscode_modern_theme'
add 'gmr.plugins.formatter'
add 'gmr.plugins.grapple'
add 'gmr.plugins.gitsigns'
add 'gmr.plugins.guess-indent'
add 'gmr.plugins.jdtls'
add 'gmr.plugins.lsp'
add 'gmr.plugins.mason'
add 'gmr.plugins.mini-indentscope'
add 'gmr.plugins.mini-surround'
add 'gmr.plugins.nvim-tree'
add 'gmr.plugins.scriptease'
add 'gmr.plugins.snacks'
add 'gmr.plugins.treesitter'
add 'gmr.plugins.treesitter-context'
add 'gmr.plugins.ts-comments'
add 'gmr.plugins.twilight'
add 'gmr.plugins.undotree'
add 'gmr.plugins.web-devicons'
add 'gmr.plugins.zen-mode'

-- if vim.fn.has 'win32' == 1 then
--     add 'gmr.plugins.telescope'
-- else
--     add 'gmr.plugins.fzf'
-- end

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

require('lazy').setup(plugin_specs, {
    ui = {
        border = 'single',
        backdrop = 100,
    },
    change_detection = {
        enabled = false,
        notify = false,
    },
    performance = {
        rtp = {
            disabled_plugins = {
                'gzip',
                'matchit',
                -- 'matchparen',
                'netrwPlugin',
                'tarPlugin',
                'tohtml',
                'tutor',
                'zipPlugin',
            },
        },
    },
})
