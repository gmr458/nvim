local lspsaga_loaded, lspsaga = pcall(require, "lspsaga")

if not lspsaga_loaded then
    print("lspsaga not loaded")
    return
end

lspsaga.init_lsp_saga({
    code_action_icon = "",
    code_action_lightbulb = {
        enable_in_insert = false,
        virtual_text = false,
    },
    finder_icons = {
        def = "",
        ref = "",
        link = "",
    },
    definition_preview_icon = "",
})

vim.keymap.set("n", "<space>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
vim.keymap.set("v", "<space>ca", "<cmd><C-U>Lspsaga range_code_action<CR>", { silent = true })

vim.keymap.set("n", "<space>rn", "<cmd>Lspsaga rename<CR>", { silent = true })

vim.keymap.set("n", "<space>pd", "<cmd>Lspsaga preview_definition<CR>", { silent = true })

vim.keymap.set("n", "<space>fd", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })
