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
    print(
        "Installing packer, plugins and treesitter parsers. After the installation is finished close and open Neovim."
    )
    vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
local packer_group = vim.api.nvim_create_augroup("Packer", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
    command = "source <afile> | PackerSync",
    group = packer_group,
    pattern = "plugins.lua",
})

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

local filetypes = {
    "asm",
    "c",
    "cmd",
    "conf",
    "cpp",
    "cs",
    "css",
    "django-html",
    "dockerfile",
    "go",
    "gomod",
    "hercules",
    "html",
    "htmldjango",
    "java",
    "javascript",
    "javascriptreact",
    "jproperties",
    "json",
    "jsonc",
    "kotlin",
    "lua",
    "make",
    "markdown",
    "php",
    "proto",
    "python",
    "ruby",
    "rust",
    "sh",
    "sql",
    "tmux",
    "toml",
    "typescript",
    "typescriptreact",
    "vim",
    "xml",
    "yaml",
    "zsh",
}

local filetypes_lsp = {
    "c",
    "cmd",
    "cpp",
    "cs",
    "css",
    "django-html",
    "dockerfile",
    "go",
    "html",
    "htmldjango",
    "java",
    "javascript",
    "javascriptreact",
    "json",
    "jsonc",
    "kotlin",
    "lua",
    "php",
    "python",
    "ruby",
    "rust",
    "sh",
    "sql",
    "typescript",
    "typescriptreact",
    "vim",
}

return packer.startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    -- Speed up loading Lua modules in Neovim to improve startup time
    use("lewis6991/impatient.nvim")

    -- Easily speed up your neovim startup time! (natively implemented in Neovim 0.7.0)
    -- use("nathom/filetype.nvim")

    -- Treesitter
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = "require('config.treesitter')",
    })
    use({
        "nvim-treesitter/nvim-treesitter-context",
        after = "nvim-treesitter",
    })
    -- use({
    --     "nvim-treesitter/playground",
    --     after = "nvim-treesitter",
    -- })
    use({
        "p00f/nvim-ts-rainbow",
        ft = filetypes,
    })
    use({
        "norcalli/nvim-colorizer.lua",
        ft = {
            "conf",
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

    -- Colorschemes
    use({
        "catppuccin/nvim",
        as = "catppuccin",
        config = "require('config.colorschemes.catppuccin')",
    })
    use({
        "wuelnerdotexe/vim-enfocado",
        -- config = "require('config.colorschemes.enfocado')",
    })
    use({
        "projekt0n/github-nvim-theme",
        -- config = "require('config.colorschemes.github')",
    })
    use({
        "rebelot/kanagawa.nvim",
        -- config = "require('config.colorschemes.kanagawa')",
    })
    use({
        "marko-cerovac/material.nvim",
        -- config = "require('config.colorschemes.material')",
    })
    use({
        "navarasu/onedark.nvim",
        -- config = "require('config.colorschemes.onedark')",
    })

    -- Telescope
    use({
        "nvim-telescope/telescope.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        cmd = "Telescope",
        config = "require('config.telescope')",
    })
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
    -- use("nvim-telescope/telescope-file-browser.nvim")
    -- use({
    --     "nvim-telescope/telescope-media-files.nvim",
    --     requires = {
    --         "nvim-lua/popup.nvim",
    --         "nvim-lua/plenary.nvim",
    --         "nvim-telescope/telescope.nvim",
    --     },
    -- })

    -- LSP
    use({
        "williamboman/nvim-lsp-installer",
        ft = filetypes_lsp,
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
    use({
        "jose-elias-alvarez/null-ls.nvim",
        after = "nvim-lspconfig",
        config = "require('config.lsp.null-ls')",
    })

    -- Completion
    use({
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        requires = {
            { "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
            { "hrsh7th/cmp-nvim-lsp-signature-help", after = "nvim-cmp" },
            { "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
            { "hrsh7th/cmp-path", after = "nvim-cmp" },
            { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
        },
        config = "require('config.cmp')",
    })

    use({
        "L3MON4D3/LuaSnip",
        event = "InsertEnter",
    })
    use("rafamadriz/friendly-snippets")
    use({
        "dsznajder/vscode-react-javascript-snippets",
        run = "yarn install --frozen-lockfile && yarn compile",
    })

    -- Other plugins
    -- use({
    --     "nvim-lualine/lualine.nvim",
    --     ft = filetypes,
    --     config = "require('config.lualine')",
    -- })
    use("feline-nvim/feline.nvim")
    use({
        "phaazon/hop.nvim",
        branch = "v1",
        event = "BufRead",
        config = "require('config.hop')",
    })
    use({
        "NMAC427/guess-indent.nvim",
        config = "require('config.guess-indent')",
    })
    use({
        "b0o/SchemaStore.nvim",
        after = "nvim-lsp-installer",
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
        ft = filetypes,
        config = "require('config.bufferline')",
    })
    use({
        "akinsho/toggleterm.nvim",
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
        ft = filetypes,
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
