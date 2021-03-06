local status_ok, bufferline = pcall(require, "bufferline")

if not status_ok then
    return
end

bufferline.setup({
    options = {
        indicator_icon = " ",
        offsets = { { filetype = "NvimTree", text = "", padding = 0 } },
        separator_style = { "", "" },
        sort_by = "insert_at_end",
    },
    highlights = { buffer_selected = { gui = "none" } },
})
