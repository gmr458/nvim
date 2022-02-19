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
    use("nvim-lua/popup.nvim")
    use("nvim-lua/plenary.nvim")
    use("windwp/nvim-autopairs")
    use("b3nj5m1n/kommentary")
    use("kyazdani42/nvim-web-devicons")
    use("kyazdani42/nvim-tree.lua")
    use("akinsho/bufferline.nvim")
    use("nvim-lualine/lualine.nvim")
    use("akinsho/toggleterm.nvim")
    use("norcalli/nvim-colorizer.lua")
    use("lukas-reineke/virt-column.nvim")
    use("ThePrimeagen/jvim.nvim")
    use("b0o/SchemaStore.nvim")

    -- Colorschemes
    use({
        "catppuccin/nvim",
        as = "catppuccin",
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

    -- cmp plugins
    use("hrsh7th/nvim-cmp") -- The completion plugin
    use("hrsh7th/cmp-buffer") -- buffer completions
    use("hrsh7th/cmp-path") -- path completions
    use("hrsh7th/cmp-cmdline") -- cmdline completions
    use("saadparwaiz1/cmp_luasnip") -- snippet completions
    use("hrsh7th/cmp-nvim-lsp")

    -- snippets
    use("L3MON4D3/LuaSnip") --snippet engine
    use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

    -- LSP
    use("neovim/nvim-lspconfig") -- enable LSP
    use("williamboman/nvim-lsp-installer") -- simple to use language server installer
    use("tamago324/nlsp-settings.nvim") -- language server settings defined in json for
    use({ "tami5/lspsaga.nvim", branch = "nvim6.0" })
    use("folke/trouble.nvim")

    -- Telescope
    use("nvim-telescope/telescope.nvim")
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
    use("nvim-telescope/telescope-file-browser.nvim")
    use("nvim-telescope/telescope-media-files.nvim")

    -- Treesitter
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    })
    use("p00f/nvim-ts-rainbow")

    -- format code
    use("mhartington/formatter.nvim")

    -- Git
    use("lewis6991/gitsigns.nvim")

    -- Automatically set up the configuration after cloning packer.nvim
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
