local status_ok, alpha = pcall(require, "alpha")

if not status_ok then
    return
end

local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = require("config.alpha-headers").Bloody

local opts = { noremap = true, silent = true }

dashboard.section.buttons.val = {
    dashboard.button(
        "tff",
        "  Find file",
        ":Telescope find_files hidden=true no_ignore=true<CR>",
        opts
    ),
    dashboard.button(
        "tfg",
        "  Live grep",
        ":Telescope live_grep preview=true<CR>",
        opts
    ),
    dashboard.button(
        "tfr",
        "  Recent File",
        ":Telescope oldfiles preview=false<CR>",
        opts
    ),
    dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>", opts),
    dashboard.button("q", "  Quit NVIM", ":qa<CR>", opts),
}

dashboard.config.opts.noautocmd = false

alpha.setup(dashboard.config)
