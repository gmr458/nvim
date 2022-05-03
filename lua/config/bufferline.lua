local status_ok, bufferline = pcall(require, "bufferline")

if not status_ok then
    return
end

bufferline.setup({
    options = {
        indicator_icon = " ",
        offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
        separator_style = { "", "" },
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
            local icon = level:match("error") and " " or " "
            return "" .. icon .. count
        end,
    },
    highlights = { buffer_selected = { gui = "bold" } },
})
