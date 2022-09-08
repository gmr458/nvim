local alpha_loaded, alpha = pcall(require, "alpha")

if not alpha_loaded then
    print("alpha not loaded")
    return
end

local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = require("config.headers").Bloody

dashboard.section.buttons.val = {
    dashboard.button("tff", "  Find file", "<CMD>silent Telescope find_files hidden=true no_ignore=true<CR>"),
    dashboard.button("tfg", "  Live grep", "<CMD>silent Telescope live_grep preview=true<CR>"),
    dashboard.button("tfr", "  Recent File", "<CMD>silent Telescope oldfiles preview=false<CR>"),
    dashboard.button("q", "  Quit NVIM", ":qa<CR>"),
}

alpha.setup(dashboard.config)
