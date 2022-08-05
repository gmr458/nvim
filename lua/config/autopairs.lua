local autopairs_loaded, autopairs = pcall(require, "nvim-autopairs")

if not autopairs_loaded then
    print("nvim-autopairs not loaded")
    return
end

autopairs.setup({})

local cmp_autopairs = require("nvim-autopairs.completion.cmp")

local cmp_loaded, cmp = pcall(require, "cmp")

if not cmp_loaded then
    print("cmp not loaded")
    return
end

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
