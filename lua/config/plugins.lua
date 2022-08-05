local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = vim.fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })

    print(
        "Installing packer, plugins and treesitter parsers. After the installation is finished close and open Neovim."
    )

    vim.cmd([[packadd packer.nvim]])
end

local packer_loaded, packer = pcall(require, "packer")

if not packer_loaded then
    print("packer not loaded")
    return
end

packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "single" })
        end,
    },
})

local normal = require("config.filetypes").normal
local lsp = require("config.filetypes").lsp

return packer.startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    -- Speed up loading Lua modules in Neovim to improve startup time
    use("lewis6991/impatient.nvim")

    -- Easily speed up your neovim startup time! (natively implemented in Neovim 0.7.0)
    use("nathom/filetype.nvim")

    -- Treesitter
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = "require('config.treesitter')",
    })
    use({
        "nvim-treesitter/nvim-treesitter-context",
        ft = normal,
    })
    use({
        "nvim-treesitter/playground",
        cmd = "TSHighlightCapturesUnderCursor",
    })
    use({
        "p00f/nvim-ts-rainbow",
        ft = normal,
    })
    use({
        "norcalli/nvim-colorizer.lua",
        cmd = "ColorizerToggle",
        config = "require('config.colorizer')",
    })

    -- Colorschemes
    -- use({
    --     "catppuccin/nvim",
    --     as = "catppuccin",
    --     -- config = "require('config.colorschemes.catppuccin')",
    -- })
    -- use({
    --     "wuelnerdotexe/vim-enfocado",
    --     -- config = "require('config.colorschemes.enfocado')",
    -- })
    -- use({
    --     "projekt0n/github-nvim-theme",
    --     -- config = "require('config.colorschemes.github')",
    -- })
    -- use({
    --     "ellisonleao/gruvbox.nvim",
    --     -- config = "require('config.colorschemes.gruvbox')",
    -- })
    use({
        "rebelot/kanagawa.nvim",
        config = "require('config.colorschemes.kanagawa')",
    })
    -- use({
    --     "marko-cerovac/material.nvim",
    --     -- config = "require('config.colorschemes.material')",
    -- })
    -- use({
    --     "navarasu/onedark.nvim",
    --     -- config = "require('config.colorschemes.onedark')",
    -- })

    -- Telescope
    use({
        "nvim-telescope/telescope.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        cmd = "Telescope",
        config = "require('config.telescope')",
    })
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

    -- LSP
    use({
        "neovim/nvim-lspconfig",
        ft = lsp,
        config = "require('config.lsp.init')",
    })
    use({
        "williamboman/mason.nvim",
        after = "nvim-lspconfig",
        config = "require('config.lsp.mason')",
    })
    use({
        "williamboman/mason-lspconfig.nvim",
        after = "mason.nvim",
        config = "require('config.lsp.mason-lspconfig')",
    })
    use({
        "folke/trouble.nvim",
        cmd = "Trouble",
        config = "require('config.trouble')",
    })
    use({
        "jose-elias-alvarez/null-ls.nvim",
        ft = lsp,
        config = "require('config.lsp.null-ls')",
    })

    -- Completion
    use({
        "L3MON4D3/LuaSnip",
        event = "InsertEnter",
    })
    use({
        "rafamadriz/friendly-snippets",
        after = "LuaSnip",
    })
    use({
        "hrsh7th/nvim-cmp",
        after = "friendly-snippets",
        config = "require('config.cmp')",
    })
    use({ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" })
    use({ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" })
    use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })
    use({ "hrsh7th/cmp-path", after = "nvim-cmp" })
    use({ "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" })

    use({
        "dsznajder/vscode-react-javascript-snippets",
        run = function()
            if vim.fn.has("win32") then
                return "yarn install --frozen-lockfile && .\node_modules\\.bin\tsc -p .\\ --noEmit false --module commonjs --outDir lib"
            end

            return "yarn install --frozen-lockfile && yarn compile"
        end,
    })

    -- Other plugins
    use({
        "feline-nvim/feline.nvim",
        after = "alpha-nvim",
        config = "require('config.feline')",
    })
    use({
        "phaazon/hop.nvim",
        branch = "v1",
        cmd = "HopChar2",
        config = "require('config.hop')",
    })
    use({
        "NMAC427/guess-indent.nvim",
        config = "require('config.guess-indent')",
    })
    use({
        "b0o/SchemaStore.nvim",
        ft = { "json", "jsonc", "yaml" },
    })
    use({
        "kyazdani42/nvim-tree.lua",
        cmd = "NvimTreeFindFileToggle",
        config = "require('config.nvim-tree')",
    })
    use({
        "kyazdani42/nvim-web-devicons",
        after = "alpha-nvim",
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
        tag = "v2.*",
        ft = normal,
        config = "require('config.bufferline')",
    })
    use({
        "akinsho/toggleterm.nvim",
        tag = "v1.*",
        cmd = "ToggleTerm",
        config = "require('config.toggleterm')",
    })
    use({
        "windwp/nvim-autopairs",
        after = "nvim-cmp",
        config = "require('config.autopairs')",
    })
    use({
        "lukas-reineke/indent-blankline.nvim",
        ft = normal,
        config = "require('config.indent-blankline')",
    })
    use({
        "goolord/alpha-nvim",
        config = "require('config.alpha')",
    })

    -- Automatically set up the configuration after cloning packer.nvim
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
