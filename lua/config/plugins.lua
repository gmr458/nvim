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

    -- improve startup time
    use("lewis6991/impatient.nvim")
    use("nathom/filetype.nvim")

    -- dependencies
    use("nvim-lua/popup.nvim")
    use("nvim-lua/plenary.nvim")

    -- use("nvim-lualine/lualine.nvim")
    use("ThePrimeagen/jvim.nvim")
    use("b0o/SchemaStore.nvim")
    use("kyazdani42/nvim-web-devicons")
    use({
        "kyazdani42/nvim-tree.lua",
        cmd = "NvimTreeToggle",
        config = "require('config.nvim-tree')",
    })
    use({
        "b3nj5m1n/kommentary",
        event = "BufRead",
        config = "require('config.kommentary')",
    })
    use({
        "lewis6991/gitsigns.nvim",
        event = "BufRead",
        config = "require('config.gitsigns')",
    })
    use({
        "akinsho/bufferline.nvim",
        event = "BufWinEnter",
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

    -- Treesitter
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        event = "BufWinEnter",
        config = "require('config.treesitter')",
    })
    use({
        "p00f/nvim-ts-rainbow",
        after = "nvim-treesitter",
    })
    use({
        "norcalli/nvim-colorizer.lua",
        ft = {
            "css",
            "html",
            "javascript",
            "json",
            "jsonc",
            "lua",
            "yaml",
        },
        config = "require('config.colorizer')",
    })
    use({
        "lukas-reineke/indent-blankline.nvim",
        event = "BufRead",
        config = "require('config.indent-blankline')",
    })

    -- Colorschemes
    use({
        "catppuccin/nvim",
        as = "catppuccin",
        config = "require('config.colorschemes.catppuccin')",
    })
    use("rebelot/kanagawa.nvim")
    use("marko-cerovac/material.nvim")
    use("navarasu/onedark.nvim")
    use("tiagovla/tokyodark.nvim")
    use("Mofiqul/dracula.nvim")
    use("yashguptaz/calvera-dark.nvim")
    use("projekt0n/github-nvim-theme")
    use("folke/tokyonight.nvim")
    use("olimorris/onedarkpro.nvim")

    -- Telescope
    use({
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        config = "require('config.telescope')",
    })
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
    use("nvim-telescope/telescope-file-browser.nvim")
    use("nvim-telescope/telescope-media-files.nvim")

    -- cmp plugins
    use("hrsh7th/nvim-cmp") -- The completion plugin
    use("hrsh7th/cmp-buffer") -- buffer completions
    use("hrsh7th/cmp-path") -- path completions
    use("hrsh7th/cmp-cmdline") -- cmdline completions
    use("saadparwaiz1/cmp_luasnip") -- snippet completions
    use("hrsh7th/cmp-nvim-lsp") -- lsp completions

    -- LSP
    use("neovim/nvim-lspconfig") -- enable LSP
    use("williamboman/nvim-lsp-installer") -- simple to use language server installer
    use("tamago324/nlsp-settings.nvim") -- language server settings defined in json for
    use("folke/trouble.nvim")

    -- snippets
    use("L3MON4D3/LuaSnip") --snippet engine
    use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

    -- Automatically set up the configuration after cloning packer.nvim
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
