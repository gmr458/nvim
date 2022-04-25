local status_ok, kanagawa = pcall(require, "kanagawa")

if not status_ok then
    return
end

local default_colors = require("kanagawa.colors").setup()

kanagawa.setup({
    undercurl = true,
    commentStyle = "italic",
    functionStyle = "NONE",
    keywordStyle = "italic",
    statementStyle = "italic",
    typeStyle = "NONE",
    variablebuiltinStyle = "italic",
    specialReturn = true,
    specialException = true,
    transparent = false,
    dimInactive = false,
    globalStatus = true,
    colors = {},
    overrides = {
        -- NvimTreeNormal = { bg = default_colors.sumiInk0 },
        -- NvimTreeNormalNC = { link = "NvimTreeNormal" },
        NormalFloat = { link = "Normal" },
        FloatBorder = { link = "Normal" },
        -- WinSeparator = {
        --     bg = default_colors.sumiInk0,
        --     fg = default_colors.sumiInk0,
        -- },
        TSInclude = { fg = default_colors.springBlue },
    },
})

vim.cmd("colorscheme kanagawa")
