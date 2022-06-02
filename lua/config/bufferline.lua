local status_ok, bufferline = pcall(require, "bufferline")

if not status_ok then
    return
end

bufferline.setup({
    options = {
        offsets = { { filetype = "NvimTree", text = "", padding = 0 } },
        separator_style = { "", "" },
    },
    highlights = { buffer_selected = { gui = "none" } },
})
