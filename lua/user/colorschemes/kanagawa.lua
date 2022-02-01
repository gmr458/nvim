local status_ok, kanagawa = pcall(require, "kanagawa")
if not status_ok then
    return
end

local colors = require("kanagawa.colors").setup()

kanagawa.setup({
    undercurl = true,
    commentStyle = "italic",
    functionStyle = "NONE",
    keywordStyle = "italic",
    statementStyle = "italic",
    typeStyle = "italic",
    variablebuiltinStyle = "italic",
    specialReturn = true,
    specialException = true,
    transparent = false,
    dimInactive = false,
    colors = {},
    overrides = {
        NvimTreeVertSplit = { bg = colors.sumiInk1 },
        StatusLineNC = { bg = colors.sumiInk1 },
    },
})

vim.cmd("colorscheme kanagawa")
