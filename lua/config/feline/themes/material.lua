local M = {}

M.palette = function()
    local colors = require("material.colors")

    local palette = {
        -- bg and fg are mandatory
        fg = colors.fg,
        bg = "#0B0C13",

        -- Common colors
        white = colors.white,
        gray = colors.gray,
        black = colors.black,
        red = colors.red,
        green = colors.green,
        yellow = colors.yellow,
        blue = colors.blue,
        paleblue = colors.paleblue,
        cyan = colors.cyan,
        purple = colors.purple,
        orange = colors.orange,
        pink = colors.pink,

        -- Dark colors
        darkred = colors.darkred,
        darkgreen = colors.darkgreen,
        darkyellow = colors.darkyellow,
        darkblue = colors.darkblue,
        darkcyan = colors.darkcyan,
        darkpurple = colors.darkpurple,
        darkorange = colors.darkorange,

        error = colors.error,
        link = colors.link,
        cursor = colors.cursor,
        title = colors.title,

        none = "NONE",
    }

    return palette
end

M.components = function()
    local components = { active = {}, inactive = {} }

    local vi_mode_utils = require("feline.providers.vi_mode")

    components.active[1] = {
        { provider = "█ ", hl = { fg = "blue" } },
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
                { str = "slant_right_thin", hl = { fg = "blue" } },
                " ",
            },
            right_sep = {
                " ",
                { str = "slant_right_thin", hl = { fg = "blue" } },
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
                { str = "slant_right_thin", hl = { fg = "blue" } },
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
                        return string.format(" %%<%s %s %s (%s%%%%) ", success_icon[frame + 1], title, msg, percentage)
                    end

                    return string.format(" %%<%s %s %s (%s%%%%) ", spinners[frame + 1], title, msg, percentage)
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
            hl = { fg = "purple" },
            icon = "  ",
        },
        {
            provider = "diagnostic_info",
            hl = { fg = "paleblue" },
            icon = "  ",
        },
    }

    components.active[2] = {
        {
            provider = "position",
            left_sep = {
                { str = "slant_right_2_thin", hl = { fg = "blue" } },
                " ",
            },
            right_sep = " ",
        },
        {
            provider = "line_percentage",
            hl = { style = "NONE" },
            left_sep = {
                { str = "slant_right_2_thin", hl = { fg = "blue" } },
                " ",
            },
            right_sep = " ",
        },
        {
            provider = "█",
            hl = { fg = "blue" },
        },
    }

    components.inactive[1] = {
        { provider = "█ ", hl = { fg = "blue" } },
        {
            provider = "file_type",
            hl = { fg = "fg", style = "NONE" },
            right_sep = {
                " ",
                { str = "slant_right_thin", hl = { fg = "blue" } },
            },
        },
        -- Empty component to fix the highlight till the end of the statusline
        {},
    }

    components.inactive[2] = {
        {
            provider = "█",
            hl = { fg = "blue" },
        },
    }

    return components
end

return M
