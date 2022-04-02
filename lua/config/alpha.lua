local status_ok, alpha = pcall(require, "alpha")

if not status_ok then
    return
end

local dashboard = require("alpha.themes.dashboard")

-- dashboard.section.header.val = {
-- [[                               __                ]],
-- [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
-- [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
-- [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
-- [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
-- [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
-- }

dashboard.section.header.val = {
    [[ ██████   █████                                ███                 ]],
    [[░░██████ ░░███                                ░░░                  ]],
    [[ ░███░███ ░███   ██████   ██████  █████ █████ ████  █████████████  ]],
    [[ ░███░░███░███  ███░░███ ███░░███░░███ ░░███ ░░███ ░░███░░███░░███ ]],
    [[ ░███ ░░██████ ░███████ ░███ ░███ ░███  ░███  ░███  ░███ ░███ ░███ ]],
    [[ ░███  ░░█████ ░███░░░  ░███ ░███ ░░███ ███   ░███  ░███ ░███ ░███ ]],
    [[ █████  ░░█████░░██████ ░░██████   ░░█████    █████ █████░███ █████]],
    [[░░░░░    ░░░░░  ░░░░░░   ░░░░░░     ░░░░░    ░░░░░ ░░░░░ ░░░ ░░░░░ ]],
}

dashboard.section.buttons.val = {
    dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button(
        "tff",
        "  Find file",
        ":Telescope find_files hidden=true no_ignore=true<CR>"
    ),
    dashboard.button("tfg", "  Live grep", ":Telescope live_grep<CR>"),
    dashboard.button(
        "<space>fb",
        "  File browser",
        ":Telescope file_browser<CR>"
    ),
    dashboard.button(
        "<space>mf",
        "  Media files",
        ":Telescope media_files<CR>"
    ),
    dashboard.button("q", "  Quit NVIM", ":qa<CR>"),
}

dashboard.config.opts.noautocmd = true

alpha.setup(dashboard.config)
