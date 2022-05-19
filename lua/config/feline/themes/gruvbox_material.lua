local M = {}

M.palette = function(mode, contrast)
    if mode == "dark" then
        local palette = {
            red = "#CC241D",
            green = "#98971A",
            yellow = "#D79921",
            blue = "#458588",
            purple = "#B16286",
            aqua = "#689D6A",
            orange = "#D65D0E",
            bright_red = "#FB4934",
            bright_green = "#B8BB26",
            bright_yellow = "#FABD2F",
            bright_blue = "#83A598",
            bright_purple = "#D3869B",
            bright_aqua = "#8EC07C",
            bright_orange = "#FE8019",
            gray = "#928374",
            bg0_h = "#1D2021",
            bg0 = "#282828",
            bg1 = "#3C3836",
            bg2 = "#504945",
            bg3 = "#665C54",
            bg4 = "#7C6F64",
            bg0_s = "#32302F",
            fg0 = "#FBF1C7",
            fg1 = "#EBDBB2",
            fg2 = "#D5C4A1",
            fg3 = "#BDAE93",
            fg4 = "#A89984",
        }

        palette.fg = palette.fg1

        if contrast == "hard" then
            palette.bg = palette.bg0
        elseif contrast == "medium" then
            palette.bg = palette.bg0_h
        elseif contrast == "soft" then
            palette.bg = palette.bg0
        end

        return palette
    elseif mode == "light" then
        local palette = {
            red = "#CC241D",
            green = "#98971A",
            yellow = "#D79921",
            blue = "#458588",
            purple = "#B16286",
            aqua = "#689D6A",
            orange = "#D65D0E",
            dark_red = "#9D0006",
            dark_green = "#79740E",
            dark_yellow = "#B57614",
            dark_blue = "#076678",
            dark_purple = "#8F3F71",
            dark_aqua = "#427B58",
            dark_orange = "#AF3A03",
            gray = "#928374",
            bg0_h = "#F9F5D7",
            bg0 = "#FBF1C7",
            bg1 = "#EBDBB2",
            bg2 = "#D5C4A1",
            bg3 = "#BDAE93",
            bg4 = "#A89984",
            bg0_s = "#F2E5BC",
            fg0 = "#282828",
            fg1 = "#3C3836",
            fg2 = "#504945",
            fg3 = "#665C54",
            fg4 = "#7C6F64",
        }

        palette.fg = palette.fg1

        if contrast == "hard" then
            palette.bg = palette.bg2
        elseif contrast == "medium" then
            palette.bg = palette.bg3
        elseif contrast == "soft" then
            palette.bg = palette.bg2
        end

        return palette
    end
end

M.components = function()
    local components = { active = {}, inactive = {} }

    local vi_mode_utils = require("feline.providers.vi_mode")

    components.active[1] = {
        { provider = "█ ", hl = { fg = "bg1" } },
        {
            provider = "vi_mode",
            hl = function()
                return {
                    name = vi_mode_utils.get_mode_highlight_name(),
                    fg = vi_mode_utils.get_mode_color(),
                    style = "NONE",
                }
            end,
            icon = "",
        },
        {
            provider = "file_info",
            hl = { fg = "fg", bg = "bg1", style = "NONE" },
            left_sep = {
                " ",
                "block",
                { str = "", hl = { bg = "bg1" } },
            },
            right_sep = {
                { str = " ", hl = { bg = "bg1" } },
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
            hl = { fg = "fg", style = "NONE" },
            left_sep = " ",
            right_sep = {
                " ",
                { str = "slant_right_thin", hl = { fg = "bg1" } },
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
            hl = { fg = "aqua" },
            icon = "  ",
        },
        {
            provider = "diagnostic_info",
            hl = { fg = "blue" },
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
                { str = "slant_right_2_thin", hl = { fg = "bg1" } },
                " ",
            },
            right_sep = " ",
        },
        {
            provider = "line_percentage",
            hl = { style = "NONE" },
            left_sep = {
                { str = "slant_right_2_thin", hl = { fg = "bg1" } },
                " ",
            },
            right_sep = " ",
        },
        {
            provider = "█",
            hl = { fg = "bg1" },
        },
    }

    components.inactive[1] = {
        {
            provider = "file_type",
            hl = { fg = "fg", bg = "bg1", style = "NONE" },
            left_sep = { str = " ", hl = { bg = "bg1" } },
            right_sep = {
                { str = " ", hl = { bg = "bg1" } },
                "slant_right",
            },
        },
        -- Empty component to fix the highlight till the end of the statusline
        {},
    }

    return components
end

return M
