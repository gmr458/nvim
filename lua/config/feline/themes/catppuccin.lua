local M = {}

M.palette = function()
    local colors = require("catppuccin.api.colors").get_colors()

    local palette = {
        -- bg and fg are mandatory
        fg = colors.white,
        bg = colors.black0,

        -- colors
        flamingo = colors.flamingo,
        mauve = colors.mauve,
        pink = colors.pink,
        maroon = colors.maroon,
        red = colors.red,
        peach = colors.peach,
        yellow = colors.yellow,
        green = colors.green,
        teal = colors.teal,
        blue = colors.blue,
        sky = colors.sky,
        black0 = colors.black0,
        black1 = colors.black1,
        black2 = colors.black2,
        black3 = colors.black3,
        black4 = colors.black4,
        gray0 = colors.gray0,
        gray1 = colors.gray1,
        gray2 = colors.gray2,
        white = colors.white,
        lavender = colors.lavender,
        rosewater = colors.rosewater,
    }

    return palette
end

M.components = function()
    local components = { active = {}, inactive = {} }

    local vi_mode_utils = require("feline.providers.vi_mode")

    local nvim_gps = require("nvim-gps")

    components.active[1] = {
        { provider = "█ ", hl = { fg = "black4" } },
        {
            provider = "vi_mode",
            hl = function()
                return {
                    name = vi_mode_utils.get_mode_highlight_name(),
                    style = "NONE",
                }
            end,
            icon = "",
        },
        {
            provider = "file_info",
            hl = { fg = "fg", style = "NONE" },
            left_sep = {
                { str = "slant_right_thin", hl = { fg = "black4" } },
                " ",
            },
            right_sep = {
                " ",
                { str = "slant_right_thin", hl = { fg = "black4" } },
            },
        },
        { provider = "git_diff_added", icon = " +", hl = { fg = "green" } },
        { provider = "git_diff_changed", icon = " ~", hl = { fg = "yellow" } },
        { provider = "git_diff_removed", icon = " -", hl = { fg = "red" } },
        {
            provider = "git_branch",
            icon = " ",
            hl = { fg = "fg", style = "NONE" },
            left_sep = " ",
            right_sep = {
                " ",
                { str = "slant_right_thin", hl = { fg = "black4" } },
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
            hl = { fg = "green" },
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
                { str = "slant_right_2_thin", hl = { fg = "black4" } },
                " ",
            },
            right_sep = " ",
        },
        {
            provider = "line_percentage",
            hl = { style = "NONE" },
            left_sep = {
                { str = "slant_right_2_thin", hl = { fg = "black4" } },
                " ",
            },
            right_sep = " ",
        },
        { provider = "█", hl = { fg = "black4" } },
    }

    components.inactive[1] = {
        { provider = "█ ", hl = { fg = "black4" } },
        {
            provider = "file_type",
            hl = { fg = "fg", style = "NONE" },
            right_sep = {
                " ",
                { str = "slant_right_thin", hl = { fg = "black4" } },
            },
        },
        -- Empty component to fix the highlight till the end of the statusline
        {},
    }

    components.inactive[2] = { { provider = "█", hl = { fg = "black4" } } }

    return components
end

return M
