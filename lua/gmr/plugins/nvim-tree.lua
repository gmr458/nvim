return {
    'nvim-tree/nvim-tree.lua',
    cmd = 'NvimTreeFindFileToggle',
    config = function()
        require('nvim-tree').setup {
            hijack_cursor = true,
            disable_netrw = true,
            view = { width = {} },
            filesystem_watchers = {
                ignore_dirs = function(path)
                    local tail = vim.fn.fnamemodify(path, ':t')
                    local ignore_list = {
                        '.cache',
                        '.env',
                        '.git',
                        '.gradle',
                        '.idea',
                        '.next',
                        '.nuxt',
                        '.nyc_output',
                        '.output',
                        '.parcel-cache',
                        '.pytest_cache',
                        '.sass-cache',
                        '.turbo',
                        '.venv',
                        '.vscode',
                        '__pycache__',
                        'bin',
                        'bower_components',
                        'build',
                        'coverage',
                        'dist',
                        'env',
                        'node_modules',
                        'obj',
                        'out',
                        'target',
                        'temp',
                        'tmp',
                        'vendor',
                        'venv',
                    }
                    return vim.tbl_contains(ignore_list, tail)
                end,
            },
            -- view = {
            --     cursorline = true,
            --     width = function()
            --         return math.floor(vim.opt.columns:get() / 3)
            --     end,
            --     float = {
            --         enable = true,
            --         open_win_config = function()
            --             local lines = vim.o.lines - vim.o.cmdheight
            --             local columns = vim.o.columns
            --
            --             return {
            --                 border = 'single',
            --                 relative = 'editor',
            --                 row = math.floor(lines * 0.08),
            --                 col = math.floor((columns / 2) / 2) - 1,
            --                 width = math.floor(columns * 0.5),
            --                 height = math.floor(lines * 0.8),
            --             }
            --         end,
            --     },
            -- },
            renderer = {
                root_folder_label = function(path)
                    return vim.fn.fnamemodify(path, ':t')
                end,
                indent_width = 3,
                special_files = {},
                highlight_git = 'none',
                highlight_diagnostics = 'none',
                highlight_opened_files = 'none',
                highlight_modified = 'none',
                indent_markers = {
                    enable = false,
                    inline_arrows = true,
                    icons = {
                        corner = '└',
                        edge = '│',
                        item = '│',
                        bottom = '─',
                        none = ' ',
                    },
                },
                icons = {
                    web_devicons = {
                        file = {
                            enable = true,
                            color = true,
                        },
                        folder = {
                            enable = false,
                            color = true,
                        },
                    },
                    git_placement = 'after',
                    modified_placement = 'before',
                    symlink_arrow = ' 󰁔 ',
                    show = {
                        file = true,
                        folder = true,
                        folder_arrow = true,
                        git = true,
                        modified = true,
                        diagnostics = true,
                        bookmarks = true,
                    },
                    glyphs = {
                        git = {
                            unstaged = 'M',
                            staged = 'A',
                            unmerged = 'U',
                            renamed = 'R',
                            untracked = '??',
                            deleted = 'D',
                            ignored = '!',
                        },
                    },
                },
            },
            git = {
                enable = true,
                timeout = 1000,
            },
            modified = {
                enable = true,
            },
            filters = {
                git_ignored = false,
                dotfiles = false,
                git_clean = false,
                no_buffer = false,
                custom = {
                    '^\\.git$',
                    -- 'node_modules',
                },
                exclude = {},
            },
        }
    end,
}
