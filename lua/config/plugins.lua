local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer, close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]])

local status_ok, packer = pcall(require, "packer")

if not status_ok then
    return
end

packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "single" })
        end,
    },
})

return packer.startup(function(use)
    use("wbthomason/packer.nvim")

    use("lewis6991/impatient.nvim")
    -- use("nathom/filetype.nvim")

    use("nvim-lua/popup.nvim")
    use("nvim-lua/plenary.nvim")

    -- use("nvim-lualine/lualine.nvim")
    use({
        "b0o/SchemaStore.nvim",
        ft = { "json", "jsonc" },
    })
    use("kyazdani42/nvim-web-devicons")
    use({
        "kyazdani42/nvim-tree.lua",
        cmd = "NvimTreeToggle",
        config = "require('config.nvim-tree')",
    })
    use({
        "b3nj5m1n/kommentary",
        event = { "BufReadPre", "InsertEnter" },
        config = "require('config.kommentary')",
    })
    use({
        "lewis6991/gitsigns.nvim",
        event = "BufRead",
        config = "require('config.gitsigns')",
    })
    use({
        "akinsho/bufferline.nvim",
        event = { "BufReadPre", "InsertEnter" },
        config = "require('config.bufferline')",
    })
    use({
        "akinsho/toggleterm.nvim",
        cmd = "ToggleTerm",
        config = "require('config.toggleterm')",
    })
    use({
        "mhartington/formatter.nvim",
        cmd = { "Format", "FormatWrite" },
        config = "require('config.formatter')",
    })
    use({
        "windwp/nvim-autopairs",
        after = "nvim-cmp",
        config = "require('config.autopairs')",
    })
    use({
        "goolord/alpha-nvim",
        config = "require('config.alpha')",
    })

    -- Treesitter
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = "require('config.treesitter')",
    })
    use({
        "p00f/nvim-ts-rainbow",
        event = "BufReadPre",
    })
    use({
        "norcalli/nvim-colorizer.lua",
        ft = { "css", "html", "javascript", "json", "jsonc", "lua", "yaml" },
        config = "require('config.colorizer')",
    })
    use({
        "lukas-reineke/indent-blankline.nvim",
        ft = {
            "c",
            "cpp",
            "cs",
            "css",
            "dockerfile",
            "go",
            "html",
            "java",
            "javascript",
            "javascriptreact",
            "json",
            "jsonc",
            "kotlin",
            "lua",
            "php",
            "python",
            "rust",
            "sql",
            "typescript",
            "typescriptreact",
            "vim",
        },
        config = "require('config.indent-blankline')",
    })

    -- Colorschemes
    --[[ use({
        "catppuccin/nvim",
        as = "catppuccin",
        -- config = "require('config.colorschemes.catppuccin')",
    }) ]]
    --[[ use({
        "rebelot/kanagawa.nvim",
        -- config = "require('config.colorschemes.kanagawa')",
    }) ]]
    --[[ use({
        "marko-cerovac/material.nvim",
        -- config = "require('config.colorschemes.material')",
    }) ]]
    use({
        "navarasu/onedark.nvim",
        config = "require('config.colorschemes.onedark')",
    })
    -- use("tiagovla/tokyodark.nvim")
    --[[ use({
        "Mofiqul/dracula.nvim",
        -- config = "require('config.colorschemes.dracula')",
    }) ]]
    -- use("yashguptaz/calvera-dark.nvim")
    --[[ use({
        "projekt0n/github-nvim-theme",
        -- config = "require('config.colorschemes.github')",
    }) ]]
    -- use("folke/tokyonight.nvim")
    -- use("olimorris/onedarkpro.nvim")

    -- Telescope
    use({
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        config = "require('config.telescope')",
    })
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
    use("nvim-telescope/telescope-file-browser.nvim")
    use("nvim-telescope/telescope-media-files.nvim")

    -- LSP
    use({
        "williamboman/nvim-lsp-installer",
        ft = {
            "c",
            "cpp",
            "cs",
            "css",
            "dockerfile",
            "go",
            "html",
            "java",
            "javascript",
            "javascriptreact",
            "json",
            "jsonc",
            "kotlin",
            "lua",
            "php",
            "python",
            "rust",
            "sql",
            "typescript",
            "typescriptreact",
            "vim",
        },
    })
    use({
        "neovim/nvim-lspconfig",
        after = "nvim-lsp-installer",
        config = function()
            require("config.lsp")
            require("config.symbols-outline")
        end,
    })
    use({
        "hrsh7th/cmp-nvim-lsp",
        after = "nvim-lsp-installer",
    })
    use({
        "folke/trouble.nvim",
        cmd = "Trouble",
        config = "require('config.trouble')",
    })
    use({
        "simrat39/symbols-outline.nvim",
        cmd = { "SymbolsOutline", "SymbolsOutlineOpen" },
    })

    -- Completion
    use({
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        requires = {
            { "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
            { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
            { "hrsh7th/cmp-path", after = "nvim-cmp" },
            { "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
        },
        config = "require('config.cmp')",
    })

    use({
        "L3MON4D3/LuaSnip",
        event = "InsertEnter",
        requires = "rafamadriz/friendly-snippets",
    })

    -- Automatically set up the configuration after cloning packer.nvim
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
