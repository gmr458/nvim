local M = {}

M.palette = function()
    local colors = require("kanagawa.colors").setup()

    local palette = {
        -- bg and fg are mandatory
        fg = colors.fujiWhite,
        bg = "#111116",
    }

    return palette
end

M.components = function()
    local components = { active = {}, inactive = {} }

    local vi_mode_utils = require("feline.providers.vi_mode")

    components.active[1] = {
        {
            provider = "█ ",
            hl = { fg = "sumiInk4" },
        },
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
            provider = { name = "file_info", opts = { file_readonly_icon = " " } },
            hl = { fg = "fg", style = "NONE" },
            left_sep = { { str = "slant_right_thin", hl = { fg = "waveBlue2" } }, " " },
            right_sep = { " ", { str = "slant_right_thin", hl = { fg = "waveBlue2" } } },
        },
        {
            provider = "git_diff_added",
            icon = " +",
            hl = { fg = "autumnGreen" },
        },
        {
            provider = "git_diff_changed",
            icon = " ~",
            hl = { fg = "autumnYellow" },
        },
        {
            provider = "git_diff_removed",
            icon = " -",
            hl = { fg = "autumnRed" },
        },
        {
            provider = "git_branch",
            icon = { str = " ", hl = { fg = "surimiOrange" } },
            hl = { fg = "fg", style = "NONE" },
            left_sep = " ",
            right_sep = { " ", { str = "slant_right_thin", hl = { fg = "waveBlue2" } } },
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
            hl = { fg = "springGreen" },
        },
        {
            provider = "diagnostic_errors",
            hl = { fg = "samuraiRed" },
            icon = "  ",
        },
        {
            provider = "diagnostic_warnings",
            hl = { fg = "roninYellow" },
            icon = "  ",
        },
        {
            provider = "diagnostic_hints",
            hl = { fg = "waveAqua1" },
            icon = "  ",
        },
        {
            provider = "diagnostic_info",
            hl = { fg = "dragonBlue" },
            icon = "  ",
        },
    }

    components.active[2] = {
        {
            provider = "position",
            left_sep = { { str = "slant_right_2_thin", hl = { fg = "waveBlue2" } }, " " },
            right_sep = " ",
        },
        {
            provider = "line_percentage",
            hl = { style = "NONE" },
            left_sep = { { str = "slant_right_2_thin", hl = { fg = "waveBlue2" } }, " " },
            right_sep = " ",
        },
        {
            provider = "█",
            hl = { fg = "sumiInk4" },
        },
    }

    components.inactive[1] = {
        {
            provider = "█ ",
            hl = { fg = "sumiInk4" },
        },
        {
            provider = "file_type",
            hl = { fg = "fg", style = "NONE" },
            right_sep = { " ", { str = "slant_right_thin", hl = { fg = "waveBlue2" } } },
        },
        -- Empty component to fix the highlight till the end of the statusline
        {},
    }

    components.inactive[2] = {
        {
            provider = "█",
            hl = { fg = "sumiInk4" },
        },
    }

    return components
end

return M
