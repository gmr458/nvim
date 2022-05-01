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
    specialReturn = false,
    specialException = true,
    transparent = false,
    dimInactive = false,
    globalStatus = true,
    colors = {},
    overrides = {
        FloatBorder = { link = "Normal" },
        NormalFloat = { link = "Normal" },
        NvimTreeGitIgnored = { fg = default_colors.fujiGray },
        -- NvimTreeNormal = { bg = default_colors.sumiInk0 },
        -- NvimTreeNormalNC = { link = "NvimTreeNormal" },
        StatusLine = { bg = default_colors.sumiInk1 },
        StatusLineNC = { bg = default_colors.sumiInk1 },
        TSInclude = { fg = default_colors.springBlue },
        -- WinSeparator = {
        --     bg = default_colors.sumiInk0,
        --     fg = default_colors.sumiInk0,
        -- },
    },
})

vim.cmd("colorscheme kanagawa")
