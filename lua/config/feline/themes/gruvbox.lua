local M = {}

M.palette = function()
    local palette = require("gruvbox.palette")

    palette.bg = "#0f1112"
    palette.fg = palette.light0_hard

    return palette
end

M.components = function()
    local components = { active = {}, inactive = {} }

    local vi_mode_utils = require("feline.providers.vi_mode")

    components.active[1] = {
        { provider = "█ ", hl = { fg = "faded_aqua" } },
        {
            provider = "vi_mode",
            hl = function()
                return {
                    name = vi_mode_utils.get_mode_highlight_name(),
                    style = "NONE",
                }
            end,
            icon = "",
            right_sep = " ",
        },
        {
            provider = "file_info",
            hl = { fg = "fg", style = "NONE" },
            left_sep = {
                { str = "slant_right_thin", hl = { fg = "gray" } },
                " ",
            },
            right_sep = {
                " ",
                { str = "slant_right_thin", hl = { fg = "gray" } },
            },
        },
        {
            provider = "git_diff_added",
            icon = " +",
            hl = { fg = "bright_green" },
        },
        {
            provider = "git_diff_changed",
            icon = " ~",
            hl = { fg = "bright_orange" },
        },
        {
            provider = "git_diff_removed",
            icon = " -",
            hl = { fg = "bright_red" },
        },
        {
            provider = "git_branch",
            icon = " ",
            hl = { fg = "fg", style = "NONE" },
            left_sep = " ",
            right_sep = {
                " ",
                { str = "slant_right_thin", hl = { fg = "gray" } },
            },
        },
        {
            provider = function()
                local lsp = vim.lsp.util.get_progress_messages()[1]

                if lsp then
                    local msg = lsp.message or ""
                    local percentage = lsp.percentage or 0
                    local title = lsp.title or ""

                    local spinners = { "", "", "" }

                    local success_icon = { "", "", "" }

                    local ms = vim.loop.hrtime() / 1000000
                    local frame = math.floor(ms / 120) % #spinners

                    if percentage >= 70 then
                        return string.format(
                            " %%<%s %s %s (%s%%%%) ",
                            success_icon[frame + 1],
                            title,
                            msg,
                            percentage
                        )
                    end

                    return string.format(
                        " %%<%s %s %s (%s%%%%) ",
                        spinners[frame + 1],
                        title,
                        msg,
                        percentage
                    )
                end

                return ""
            end,
            hl = { fg = "bright_green" },
        },
        {
            provider = "diagnostic_errors",
            hl = { fg = "bright_red" },
            icon = "  ",
        },
        {
            provider = "diagnostic_warnings",
            hl = { fg = "bright_yellow" },
            icon = "  ",
        },
        {
            provider = "diagnostic_hints",
            hl = { fg = "bright_aqua" },
            icon = "  ",
        },
        {
            provider = "diagnostic_info",
            hl = { fg = "bright_blue" },
            icon = "  ",
        },
    }

    components.active[2] = {
        {
            provider = "position",
            left_sep = {
                { str = "slant_right_2_thin", hl = { fg = "gray" } },
                " ",
            },
            right_sep = " ",
        },
        {
            provider = "line_percentage",
            hl = { style = "NONE" },
            left_sep = {
                { str = "slant_right_2_thin", hl = { fg = "gray" } },
                " ",
            },
            right_sep = " ",
        },
        { provider = "█", hl = { fg = "faded_aqua" } },
    }

    components.inactive[1] = {
        { provider = "█ ", hl = { fg = "faded_aqua" } },
        {
            provider = "file_type",
            hl = { fg = "fg", style = "NONE" },
            right_sep = {
                " ",
                { str = "slant_right_thin", hl = { fg = "gray" } },
            },
        },
        -- Empty component to fix the highlight till the end of the statusline
        {},
    }

    components.inactive[2] = {
        { provider = "█", hl = { fg = "faded_aqua" } },
    }
    return components
end

return M
