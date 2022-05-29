local M = {}

M.palette = function()
    local palette = {
        -- bg and fg are mandatory
        -- fg = ,
        -- bg = ,

        -- colors
    }

    return palette
end

M.components = function()
    local components = { active = {}, inactive = {} }

    local vi_mode_utils = require("feline.providers.vi_mode")

    components.active[1] = {
        { provider = "█ ", hl = { fg = "wave_blue2" } },
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
                { str = "slant_right_thin", hl = { fg = "wave_blue2" } },
                " ",
            },
            right_sep = {
                " ",
                { str = "slant_right_thin", hl = { fg = "wave_blue2" } },
            },
        },
        {
            provider = "git_diff_added",
            icon = " +",
            hl = { fg = "autumn_green" },
        },
        {
            provider = "git_diff_changed",
            icon = " ~",
            hl = { fg = "autumn_yellow" },
        },
        {
            provider = "git_diff_removed",
            icon = " -",
            hl = { fg = "autumn_red" },
        },
        {
            provider = "git_branch",
            icon = " ",
            hl = { fg = "fg", style = "NONE" },
            left_sep = " ",
            right_sep = {
                " ",
                { str = "slant_right_thin", hl = { fg = "wave_blue2" } },
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
            hl = { fg = "spring_green" },
        },
        {
            provider = "diagnostic_errors",
            hl = { fg = "samurai_red" },
            icon = "  ",
        },
        {
            provider = "diagnostic_warnings",
            hl = { fg = "ronin_yellow" },
            icon = "  ",
        },
        {
            provider = "diagnostic_hints",
            hl = { fg = "wave_aqua1" },
            icon = "  ",
        },
        {
            provider = "diagnostic_info",
            hl = { fg = "dragon_blue" },
            icon = "  ",
        },
    }

    components.active[2] = {
        {
            provider = "position",
            left_sep = {
                { str = "slant_right_2_thin", hl = { fg = "wave_blue2" } },
                " ",
            },
            right_sep = " ",
        },
        {
            provider = "line_percentage",
            hl = { style = "NONE" },
            left_sep = {
                { str = "slant_right_2_thin", hl = { fg = "wave_blue2" } },
                " ",
            },
            right_sep = " ",
        },
        {
            provider = "█",
            hl = { fg = "wave_blue2" },
        },
    }

    components.inactive[1] = {
        { provider = "█ ", hl = { fg = "wave_blue2" } },
        {
            provider = "file_type",
            hl = { fg = "fg", style = "NONE" },
            right_sep = {
                " ",
                { str = "slant_right_thin", hl = { fg = "wave_blue2" } },
            },
        },
        -- Empty component to fix the highlight till the end of the statusline
        {},
    }

    components.inactive[2] = {
        {
            provider = "█",
            hl = { fg = "wave_blue2" },
        },
    }

    return components
end

return M
