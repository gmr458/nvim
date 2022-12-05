local rose_pine_loaded, rose_pine = pcall(require, "rose-pine")

if not rose_pine_loaded then
    print("rose-pine not loaded")
    return
end

rose_pine.setup({
    dark_variant = "main",
    bold_vert_split = false,
    dim_nc_background = false,
    disable_background = false,
    disable_float_background = false,
    disable_italics = true,
    highlight_groups = {
        NormalFloat = { bg = "NONE" },
        StatusLine = { bg = "NONE" },
        NvimTreeRootFolder = { fg = "base" },

        -- TreesitterContext
        TreesitterContext = { bg = "overlay" },
        TreesitterContextLineNumber = { bg = "overlay" },

        -- Telescope
        TelescopeBorder = { bg = "highlight_low", fg = "highlight_low" },
        TelescopeNormal = { bg = "highlight_low" },

        -- Telescope Preview
        TelescopePreviewBorder = { bg = "surface", fg = "surface" },
        TelescopePreviewNormal = { bg = "surface" },
        TelescopePreviewTitle = { bg = "surface", fg = "text" },

        -- Telescope Prompt
        TelescopePromptBorder = { bg = "highlight_med", fg = "highlight_med" },
        TelescopePromptNormal = { bg = "highlight_med" },
        TelescopePromptTitle = { bg = "highlight_med", fg = "text" },

        -- Telescope Selection
        TelescopeSelection = { bg = "highlight_low", fg = "foam" },
        TelescopeMultiSelection = { bg = "highlight_low" },

        Search = { fg = "rose" },
    },
})

vim.cmd("colorscheme rose-pine")
