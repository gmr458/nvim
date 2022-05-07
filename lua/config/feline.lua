local status_ok, feline = pcall(require, "feline")

if not status_ok then
    return
end

local kanagawa_colors = require("kanagawa.colors").setup()

local kanagawa = {
    fg = kanagawa_colors.oldWhite,
    bg = kanagawa_colors.sumiInk0,
    black = kanagawa_colors.sumiInk0,
    skyblue = kanagawa_colors.dragonBlue,
    cyan = kanagawa_colors.lightBlue,
    green = kanagawa_colors.springGreen,
    oceanblue = kanagawa_colors.waveBlue2,
    magenta = kanagawa_colors.springViolet1,
    orange = kanagawa_colors.surimiOrange,
    red = kanagawa_colors.peachRed,
    violet = kanagawa_colors.oniViolet,
    white = kanagawa_colors.fujiWhite,
    yellow = kanagawa_colors.carpYellow,
}

local components = {
    active = {},
    inactive = {},
}

local vi_mode_utils = require("feline.providers.vi_mode")

components.active[1] = {
    {
        provider = "█ ",
        hl = {
            fg = "skyblue",
        },
    },
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
        hl = {
            fg = "white",
            bg = "oceanblue",
            style = "bold",
        },
        left_sep = {
            " ",
            "block",
            { str = "", hl = { bg = "oceanblue", fg = "NONE" } },
        },
        right_sep = {
            { str = " ", hl = { bg = "oceanblue", fg = "NONE" } },
            "slant_right",
        },
    },
    {
        provider = "git_diff_added",
        icon = " +",
        hl = {
            fg = "green",
            bg = "bg",
        },
    },
    {
        provider = "git_diff_changed",
        icon = " ~",
        hl = {
            fg = "orange",
            bg = "bg",
        },
    },
    {
        provider = "git_diff_removed",
        icon = " -",
        hl = {
            fg = "red",
            bg = "bg",
        },
    },
    {
        provider = "git_branch",
        icon = " ",
        hl = {
            fg = "white",
            bg = "black",
            style = "bold",
        },
        left_sep = " ",
        right_sep = {
            " ",
            {
                str = "slant_right_thin",
                hl = { bg = "bg", fg = "oceanblue" },
            },
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
        hl = { fg = "cyan" },
        icon = "  ",
    },
    {
        provider = "diagnostic_info",
        hl = { fg = "skyblue" },
        icon = "  ",
    },
    {
        provider = function()
            local Lsp = vim.lsp.util.get_progress_messages()[1]

            if Lsp then
                local msg = Lsp.message or ""
                local percentage = Lsp.percentage or 0
                local title = Lsp.title or ""
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
        hl = { fg = kanagawa.green },
    },
}

components.active[2] = {
    {
        provider = "position",
        left_sep = {
            {
                str = "slant_right_2_thin",
                hl = { bg = "bg", fg = "oceanblue" },
            },
            " ",
        },
        right_sep = " ",
    },
    {
        provider = "line_percentage",
        hl = {
            style = "bold",
        },
        left_sep = {
            {
                str = "slant_right_2_thin",
                hl = { bg = "bg", fg = "oceanblue" },
            },
            " ",
        },
        right_sep = " ",
    },
    {
        provider = "█",
        hl = {
            fg = "skyblue",
        },
    },
}

components.inactive[1] = {
    {
        provider = "file_type",
        hl = {
            fg = "white",
            bg = "oceanblue",
            style = "bold",
        },
        left_sep = {
            str = " ",
            hl = {
                fg = "NONE",
                bg = "oceanblue",
            },
        },
        right_sep = {
            {
                str = " ",
                hl = {
                    fg = "NONE",
                    bg = "oceanblue",
                },
            },
            "slant_right",
        },
    },
    -- Empty component to fix the highlight till the end of the statusline
    {},
}

feline.setup({
    force_inactive = {
        filetypes = {
            "^NvimTree$",
            "^packer$",
            "^startify$",
            "^fugitive$",
            "^fugitiveblame$",
            "^qf$",
            "^help$",
            "^TelescopePrompt$",
            "^alpha$",
            "^lsp%-installer$",
            "^lspinfo$",
        },
        buftypes = {
            "^terminal$",
        },
        bufnames = {},
    },
    theme = kanagawa,
    components = components,
})
