local bufferline_loaded, bufferline = pcall(require, "bufferline")

if not bufferline_loaded then
    print("bufferline not loaded")
    return
end

bufferline.setup({
    options = {
        indicator_icon = " ",
        separator_style = { "", "" },
        sort_by = "insert_at_end",
        offsets = { { filetype = "NvimTree", text = "" } },
    },
})
