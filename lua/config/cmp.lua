local cmp_status_ok, cmp = pcall(require, "cmp")

if not cmp_status_ok then
    return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")

if not snip_status_ok then
    return
end

require("luasnip.loaders.from_vscode").load()

local check_backspace = function()
    local col = vim.fn.col(".") - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

local lspkindicons = {
    Text = "",
    Method = "",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "𝓒",
    Interface = "",
    Module = "",
    Property = "ﰠ",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "𝓢",
    Event = "",
    Operator = "",
    TypeParameter = "",
}

cmp.setup({
    preselect = cmp.PreselectMode.None,
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = {
        ["<S-k>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<S-j>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-e>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expandable() then
                luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif check_backspace() then
                fallback()
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
    },
    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = string.format(
                "%s %s",
                lspkindicons[vim_item.kind],
                vim_item.kind
            )
            return vim_item
        end,
    },
    sources = {
        { name = "luasnip" },
        { name = "nvim_lua" },
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
    },
    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
    },
    documentation = {
        border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
    },
})

luasnip.filetype_extend("javascript", { "html" })
luasnip.filetype_extend("javascriptreact", { "html" })
luasnip.filetype_extend("typescript", { "html" })
luasnip.filetype_extend("typescriptreact", { "html" })
