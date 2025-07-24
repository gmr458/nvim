return {
    'mhartington/formatter.nvim',
    cmd = 'Format',
    config = function()
        local util = require 'formatter.util'

        local prettier = require 'gmr.configs.formatter.prettier'
        local web = require 'gmr.configs.formatter.web'

        require('formatter').setup {
            logging = true,
            filetype = {
                astro = { prettier },
                cs = { require('formatter.filetypes.cs').csharpier },
                css = { prettier },
                dart = { require('formatter.filetypes.dart').dartformat },
                gleam = {
                    function()
                        return {
                            exe = 'gleam',
                            args = { 'format' },
                        }
                    end,
                },
                go = { require('formatter.filetypes.go').gofumpt },
                html = { prettier },
                htmldjango = {
                    function()
                        return {
                            exe = 'djlint',
                            args = {
                                '--reformat',
                                '--preserve-leading-space',
                                '--preserve-blank-lines',
                                '--indent',
                                vim.bo.tabstop,
                            },
                        }
                    end,
                },
                java = {
                    function()
                        return {
                            exe = 'google-java-format',
                            args = {
                                '--aosp',
                                util.escape_path(
                                    util.get_current_buffer_file_path()
                                ),
                                '--replace',
                                '--skip-removing-unused-imports',
                            },
                            stdin = true,
                        }
                    end,
                },
                javascript = { web },
                javascriptreact = { web },
                json = { web },
                jsonc = { web },
                kotlin = {
                    function()
                        return {
                            exe = 'ktfmt',
                            args = {
                                '--kotlinlang-style',
                                vim.fn.shellescape(
                                    vim.api.nvim_buf_get_name(0)
                                ),
                            },
                            stdin = true,
                        }
                    end,
                },
                lua = require('formatter.filetypes.lua').stylua,
                ocaml = {
                    function()
                        return {
                            exe = 'ocamlformat',
                            args = {
                                '--enable-outside-detected-project',
                                '--break-cases=toplevel',
                                '--if-then-else=fit-or-vertical',
                                vim.fn.shellescape(
                                    vim.api.nvim_buf_get_name(0)
                                ),
                            },
                            stdin = true,
                        }
                    end,
                },
                php = require('formatter.filetypes.php').pint,
                proto = require('formatter.filetypes.proto').buf_format,
                python = require('formatter.filetypes.python').ruff,
                rust = require('formatter.filetypes.rust').rustfmt,
                scss = { prettier },
                svelte = { prettier },
                template = {
                    function()
                        return {
                            exe = 'djlint',
                            args = {
                                '--reformat',
                                '--quiet',
                                vim.fn.shellescape(
                                    vim.api.nvim_buf_get_name(0)
                                ),
                            },
                            stdin = false,
                        }
                    end,
                },
                toml = require('formatter.filetypes.toml').taplo,
                typescript = { web },
                typescriptreact = { web },
                yaml = require('formatter.filetypes.yaml').yamlfmt,
                zig = require('formatter.filetypes.zig').zigfmt,
            },
        }
    end,
}
