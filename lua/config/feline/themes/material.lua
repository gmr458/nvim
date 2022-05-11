local M = {}

M.palette = function()
    local colors = require("material.colors")

    local palette = {
        -- bg and fg are mandatory
        fg = colors.fg,
        bg = colors.fg,

        -- colors
    }

    return palette
end

M.components = function()
    local components = { active = {}, inactive = {} }

    local vi_mode_utils = require("feline.providers.vi_mode")

    components.active[1] = {
        { provider = "█ ", hl = { fg = "black4" } },
        {
            provider = "vi_mode",
            hl = function()
                return {
                    name = vi_mode_utils.get_mode_highlight_name(),
                    fg = vi_mode_utils.get_mode_color(),
                    style = "bold",
                }
            end,
            icon = "",
        },
        {
            provider = "file_info",
            hl = { fg = "fg", bg = "black4", style = "bold" },
            left_sep = { " ", "block", { str = "", hl = { bg = "black4" } } },
            right_sep = {
                { str = " ", hl = { bg = "black4" } },
                "slant_right",
            },
        },
        {
            provider = "git_diff_added",
            icon = " +",
            hl = { fg = "green" },
        },
        {
            provider = "git_diff_changed",
            icon = " ~",
            hl = { fg = "yellow" },
        },
        {
            provider = "git_diff_removed",
            icon = " -",
            hl = { fg = "red" },
        },
        {
            provider = "git_branch",
            icon = " ",
            hl = { fg = "fg", style = "bold" },
            left_sep = " ",
            right_sep = {
                " ",
                { str = "slant_right_thin", hl = { fg = "black4" } },
            },
        },
        {
            provider = "diagnostic_errors",
            hl = { fg = "red" },
            icon = "  ",
        },
        {
            provider = "diagnostic_warnings",
            hl = { fg = "yellow" },
            icon = "  ",
        },
        {
            provider = "diagnostic_hints",
            hl = { fg = "rosewater" },
            icon = "  ",
        },
        {
            provider = "diagnostic_info",
            hl = { fg = "sky" },
            icon = "  ",
        },
        {
            provider = function()
                local lsp = vim.lsp.util.get_progress_messages()[1]

                if lsp then
                    local msg = lsp.message or ""
                    local percentage = lsp.percentage or 0
                    local title = lsp.title or ""

                    local spinners = {
                        "",
                        "",
                        "",
                    }

                    local success_icon = {
                        "",
                        "",
                        "",
                    }

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
            hl = { fg = "green" },
        },
    }

    components.active[2] = {
        {
            provider = "position",
            left_sep = {
                { str = "slant_right_2_thin", hl = { fg = "black4" } },
                " ",
            },
            right_sep = " ",
        },
        {
            provider = "line_percentage",
            hl = { style = "bold" },
            left_sep = {
                { str = "slant_right_2_thin", hl = { fg = "black4" } },
                " ",
            },
            right_sep = " ",
        },
        {
            provider = "█",
            hl = { fg = "black4" },
        },
    }

    components.inactive[1] = {
        {
            provider = "file_type",
            hl = { fg = "fg", bg = "black4", style = "bold" },
            left_sep = { str = " ", hl = { bg = "black4" } },
            right_sep = {
                { str = " ", hl = { bg = "black4" } },
                "slant_right",
            },
        },
        -- Empty component to fix the highlight till the end of the statusline
        {},
    }

    return components
end

return M
