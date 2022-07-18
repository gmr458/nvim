local status_ok, gitsigns = pcall(require, "gitsigns")

if not status_ok then
    return
end

gitsigns.setup({
    signs = {
        delete = {
            hl = "GitSignsDelete",
            text = "契",
            numhl = "GitSignsDeleteNr",
            linehl = "GitSignsDeleteLn",
        },
        topdelete = {
            hl = "GitSignsDelete",
            text = "契",
            numhl = "GitSignsDeleteNr",
            linehl = "GitSignsDeleteLn",
        },
    },
    attach_to_untracked = false,
})
