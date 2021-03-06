local status_ok, indent_blankline = pcall(require, "indent_blankline")

if not status_ok then
    return
end

indent_blankline.setup({
    show_current_context = true,
    show_current_context_start = false,
    filetype_exclude = {
        "alpha",
        "help",
        "lsp-installer",
        "lspinfo",
        "NvimTree",
        "packer",
        "toggleterm",
    },
})

vim.cmd([[let g:indent_blankline_show_trailing_blankline_indent = v:false]])
