local status_ok, kanagawa = pcall(require, "kanagawa")

if not status_ok then
    return
end

kanagawa.setup({
    undercurl = true,
    commentStyle = "NONE",
    functionStyle = "NONE",
    keywordStyle = "NONE",
    statementStyle = "NONE",
    typeStyle = "NONE",
    variablebuiltinStyle = "NONE",
    specialReturn = true,
    specialException = true,
    transparent = false,
    dimInactive = false,
    globalStatus = true,
    colors = {},
    overrides = {},
})

vim.cmd("colorscheme kanagawa")
