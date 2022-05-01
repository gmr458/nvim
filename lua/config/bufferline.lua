local status_ok, bufferline = pcall(require, "bufferline")

if not status_ok then
    return
end

bufferline.setup({
    options = {
        indicator_icon = " ",
        offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
        separator_style = { "", "" },
    },
    highlights = {
        buffer_selected = { gui = "NONE" },
        diagnostic_selected = { gui = "bold" },
        duplicate = { gui = "bold" },
        duplicate_selected = { gui = "bold" },
        duplicate_visible = { gui = "bold" },
        error_diagnostic_selected = { gui = "bold" },
        error_selected = { gui = "bold" },
        info_diagnostic_selected = { gui = "bold" },
        info_selected = { gui = "bold" },
        pick = { gui = "bold" },
        pick_selected = { gui = "bold" },
        pick_visible = { gui = "bold" },
        warning_diagnostic_selected = { gui = "bold" },
        warning_selected = { gui = "bold" },
    },
})
