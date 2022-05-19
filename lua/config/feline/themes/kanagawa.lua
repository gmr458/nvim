local M = {}

M.palette = function()
    local colors = require("kanagawa.colors").setup()

    local palette = {
        -- bg and fg are mandatory
        fg = colors.fujiWhite,
        bg = colors.sumiInk0,

        -- colors
        fuji_white = colors.fujiWhite,
        old_white = colors.oldWhite,
        sumi_ink0 = colors.sumiInk0,
        sumi_ink1 = colors.sumiInk1,
        sumi_ink2 = colors.sumiInk2,
        sumi_ink3 = colors.sumiInk3,
        sumi_ink4 = colors.sumiInk4,
        wave_blue1 = colors.waveBlue1,
        wave_blue2 = colors.waveBlue2,
        winter_green = colors.winterGreen,
        winter_yellow = colors.winterYellow,
        winter_red = colors.winterRed,
        winter_blue = colors.winterBlue,
        autumn_green = colors.autumnGreen,
        autumn_red = colors.autumnRed,
        autumn_yellow = colors.autumnYellow,
        samurai_red = colors.samuraiRed,
        ronin_yellow = colors.roninYellow,
        wave_aqua1 = colors.waveAqua1,
        dragon_blue = colors.dragonBlue,
        fuji_gray = colors.fujiGray,
        spring_violet1 = colors.springViolet1,
        oni_violet = colors.oniViolet,
        crystal_blue = colors.crystalBlue,
        spring_violet2 = colors.springViolet2,
        spring_blue = colors.springBlue,
        light_blue = colors.lightBlue,
        wave_aqua2 = colors.waveAqua2,
        spring_green = colors.springGreen,
        boat_yellow1 = colors.boatYellow1,
        boat_yellow2 = colors.boatYellow2,
        carp_yellow = colors.carpYellow,
        sakura_pink = colors.sakuraPink,
        wave_red = colors.waveRed,
        peach_red = colors.peachRed,
        surimi_orange = colors.surimiOrange,
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
                    fg = vi_mode_utils.get_mode_color(),
                    style = "NONE",
                }
            end,
            icon = "",
        },
        {
            provider = "file_info",
            hl = { fg = "fg", bg = "wave_blue2", style = "NONE" },
            left_sep = {
                " ",
                "block",
                { str = "", hl = { bg = "wave_blue2" } },
            },
            right_sep = {
                { str = " ", hl = { bg = "wave_blue2" } },
                "slant_right",
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
            hl = { fg = "spring_green" },
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
        {
            provider = "file_type",
            hl = { fg = "fg", bg = "wave_blue2", style = "NONE" },
            left_sep = { str = " ", hl = { bg = "wave_blue2" } },
            right_sep = {
                { str = " ", hl = { bg = "wave_blue2" } },
                "slant_right",
            },
        },
        -- Empty component to fix the highlight till the end of the statusline
        {},
    }

    return components
end

return M
