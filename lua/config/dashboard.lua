local dashboard_loaded, dashboard = pcall(require, "dashboard")

if not dashboard_loaded then
    print("dashboard not loaded")
    return
end

dashboard.custom_header = require("config.headers").Bloody

dashboard.custom_center = {
    {
        icon = "  ",
        desc = "Find file                              ",
        shortcut = "tff",
        action = "Telescope find_files hidden=true no_ignore=true",
    },
    {
        icon = "  ",
        desc = "Live grep                              ",
        shortcut = "tfg",
        action = "Telescope live_grep preview=true",
    },
    {
        icon = "  ",
        desc = "Recent file                            ",
        shortcut = "tfr",
        action = "Telescope oldfiles preview=false",
    },
    {
        icon = "  ",
        desc = "Quit                             ",
        shortcut = "<space>qa",
    },
}

dashboard.hide_statusline = false
