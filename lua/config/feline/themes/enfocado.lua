local M = {}

M.palette = function()
    local palette = {
        -- bg and fg are mandatory
        -- bg = "#252525",
        bg = "#121212",
        fg = "#B9B9B9",

        -- colors
        bg_0 = "#181818",
        bg_1 = "#252525",
        bg_2 = "#3B3B3B",
        dim_0 = "#777777",
        fg_0 = "#B9B9B9",
        fg_1 = "#DEDEDE",
        red = "#ED4A46",
        green = "#70B433",
        yellow = "#DBB32D",
        blue = "#368AEB",
        magenta = "#EB6EB7",
        cyan = "#3FC5B7",
        orange = "#E67F43",
        violet = "#A580E2",
        br_red = "#FF5E56",
        br_green = "#83C746",
        br_yellow = "#EFC541",
        br_blue = "#4F9CFE",
        br_magenta = "#FF81CA",
        br_cyan = "#56D8C9",
        br_orange = "#FA9153",
        br_violet = "#B891F5",
        black = "#000000",
    }

    return palette
end

M.components = function()
    local components = { active = {}, inactive = {} }

    local vi_mode_utils = require("feline.providers.vi_mode")

    local nvim_gps = require("nvim-gps")

    components.active[1] = {
        { provider = "█ ", hl = { fg = "br_cyan" } },
        {
            provider = "vi_mode",
            hl = function()
                return {
                    name = vi_mode_utils.get_mode_highlight_name(),
                    style = "NONE",
                }
            end,
            icon = "",
            right_sep = { " " },
        },
        {
            provider = "file_info",
            hl = { fg = "fg", style = "NONE" },
            left_sep = {
                { str = "slant_right_thin", hl = { fg = "br_cyan" } },
                " ",
            },
            right_sep = {
                " ",
                { str = "slant_right_thin", hl = { fg = "br_cyan" } },
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
            hl = { fg = "fg", style = "NONE" },
            left_sep = " ",
            right_sep = {
                " ",
                { str = "slant_right_thin", hl = { fg = "br_cyan" } },
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
            hl = { fg = "br_cyan" },
        },
        {
            provider = "diagnostic_errors",
            hl = { fg = "br_red" },
            icon = "  ",
        },
        {
            provider = "diagnostic_warnings",
            hl = { fg = "br_orange" },
            icon = "  ",
        },
        {
            provider = "diagnostic_hints",
            hl = { fg = "br_blue" },
            icon = "  ",
        },
        {
            provider = "diagnostic_info",
            hl = { fg = "br_yellow" },
            icon = "  ",
        },
        {
            provider = function()
                return nvim_gps.get_location()
            end,
            enabled = function()
                return nvim_gps.is_available()
            end,
            left_sep = " ",
        },
    }

    components.active[2] = {
        {
            provider = "position",
            left_sep = {
                { str = "slant_right_2_thin", hl = { fg = "br_cyan" } },
                " ",
            },
            right_sep = " ",
        },
        {
            provider = "line_percentage",
            hl = { style = "NONE" },
            left_sep = {
                { str = "slant_right_2_thin", hl = { fg = "br_cyan" } },
                " ",
            },
            right_sep = " ",
        },
        {
            provider = "█",
            hl = { fg = "br_cyan" },
        },
    }

    components.inactive[1] = {
        { provider = "█ ", hl = { fg = "br_cyan" } },
        {
            provider = "file_type",
            hl = { fg = "fg", style = "NONE" },
            right_sep = {
                " ",
                { str = "slant_right_thin", hl = { fg = "br_cyan" } },
            },
        },
        -- Empty component to fix the highlight till the end of the statusline
        {},
    }

    components.inactive[2] = {
        {
            provider = "█",
            hl = { fg = "br_cyan" },
        },
    }

    return components
end

return M
