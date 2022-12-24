local lspsaga_loaded, lspsaga = pcall(require, "lspsaga")

if not lspsaga_loaded then
    print("lspsaga not loaded")
    return
end

local colors = {
    fg = "#bbc2cf",
    red = "#e95678",
    orange = "#FF8700",
    yellow = "#f7bb3b",
    green = "#afd700",
    cyan = "#36d0e0",
    blue = "#61afef",
    violet = "#CBA6F7",
    teal = "#1abc9c",
}

lspsaga.init_lsp_saga({
    code_action_icon = "",
    -- same as nvim-lightbulb but async
    code_action_lightbulb = {
        enable = false,
        enable_in_insert = false,
        cache_code_action = false,
        sign = false,
        -- update_time = 150,
        -- sign_priority = 20,
        virtual_text = false,
    },
    -- finder icons
    finder_icons = {
        def = "",
        imp = "",
        ref = "",
    },
    show_outline = {
        win_position = "right",
        win_with = "",
        win_width = 30,
        auto_enter = true,
        auto_preview = false,
        virt_text = "┃",
        jump_key = "o",
        auto_refresh = true,
    },
    -- custom lsp kind
    -- usage { Field = 'color code'} or {Field = {your icon, your color code}}
    custom_kind = {
        File = { "file ", colors.fg },
        Module = { "module ", colors.blue },
        Namespace = { "namespace ", colors.orange },
        Package = { "package ", colors.violet },
        Class = { "class ", colors.violet },
        Method = { "method ", colors.violet },
        Property = { "property ", colors.cyan },
        Field = { "field ", colors.teal },
        Constructor = { "constructor ", colors.blue },
        Enum = { "enum ", colors.green },
        Interface = { "interface ", colors.orange },
        Function = { "function ", colors.violet },
        Variable = { "variable ", colors.blue },
        Constant = { "constant ", colors.cyan },
        String = { "string ", colors.green },
        Number = { "number ", colors.green },
        Boolean = { "boolean ", colors.orange },
        Array = { "array ", colors.blue },
        Object = { "object ", colors.orange },
        Key = { "key ", colors.red },
        Null = { "null ", colors.red },
        EnumMember = { "enum member ", colors.green },
        Struct = { "struct ", colors.violet },
        Event = { "event ", colors.violet },
        Operator = { "operator ", colors.green },
        TypeParameter = { "type parameter ", colors.green },
        TypeAlias = { "type alias ", colors.green },
        Parameter = { "parameter ", colors.blue },
        StaticMethod = { "static method ", colors.orange },
        Macro = { "macro ", colors.red },
    },
})

-- vim.keymap.set("n", "<space>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
-- vim.keymap.set("v", "<space>ca", "<cmd><C-U>Lspsaga range_code_action<CR>", { silent = true })

vim.keymap.set("n", "<space>pd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })

vim.keymap.set("n", "<space>fd", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })
