local M = {}

M.palette = function()
    local palette = require("onedark.palette")
    local style = require("config.colorschemes.onedark").style

    if style == "cool" then
        palette.cool.bg = palette.cool.black
        return palette.cool
    elseif style == "dark" then
        palette.dark.bg = palette.dark.black
        return palette.dark
    elseif style == "darker" then
        palette.darker.bg = palette.darker.black
        return palette.darker
    elseif style == "deep" then
        palette.deep.bg = palette.deep.black
        return palette.deep
    elseif style == "light" then
        palette.light.bg = palette.light.black
        return palette.light
    elseif style == "warm" then
        palette.warm.bg = palette.warm.black
        return palette.warm
    elseif style == "warmer" then
        palette.warmer.bg = palette.warmer.black
        return palette.warmer
    end

    return palette
end

M.components = function()
    local components = { active = {}, inactive = {} }

    local vi_mode_utils = require("feline.providers.vi_mode")

    components.active[1] = {
        { provider = "█ " },
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
            hl = { style = "NONE" },
            left_sep = {
                { str = "slant_right_thin", hl = { fg = "fg" } },
                " ",
            },
            right_sep = {
                " ",
                { str = "slant_right_thin", hl = { fg = "fg" } },
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
            hl = { fg = "blue" },
        },
        {
            provider = "git_diff_removed",
            icon = " -",
            hl = { fg = "red" },
        },
        {
            provider = "git_branch",
            icon = " ",
            hl = { style = "NONE" },
            left_sep = " ",
            right_sep = {
                " ",
                { str = "slant_right_thin", hl = { fg = "fg" } },
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
            hl = { fg = "purple" },
            icon = "  ",
        },
        {
            provider = "diagnostic_info",
            hl = { fg = "cyan" },
            icon = "  ",
        },
    }

    components.active[2] = {
        {
            provider = "position",
            left_sep = {
                { str = "slant_right_2_thin", hl = { fg = "fg" } },
                " ",
            },
            right_sep = " ",
        },
        {
            provider = "line_percentage",
            hl = { style = "NONE" },
            left_sep = {
                { str = "slant_right_2_thin", hl = { fg = "fg" } },
                " ",
            },
            right_sep = " ",
        },
        { provider = "█" },
    }

    components.inactive[1] = {
        { provider = "█ " },
        {
            provider = "file_type",
            hl = { style = "NONE" },
            right_sep = {
                " ",
                { str = "slant_right_thin", hl = { fg = "fg" } },
            },
        },
        -- Empty component to fix the highlight till the end of the statusline
        {},
    }

    components.inactive[2] = { { provider = "█" } }

    return components
end

return M
