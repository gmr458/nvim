local luasnip_loaded, luasnip = pcall(require, "luasnip")

if not luasnip_loaded then
    print("luasnip not loaded")
    return
end

require("luasnip.loaders.from_vscode").lazy_load({
    path = "~/.local/share/nvim/site/pack/packer/start/vscode-es7-javascript-react-snippets",
})

local cmp_loaded, cmp = pcall(require, "cmp")

if not cmp_loaded then
    print("cmp not loaded")
    return
end

cmp.setup({
    preselect = cmp.PreselectMode.None,
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    window = {
        completion = {
            border = {
                "┌",
                "─",
                "┐",
                "│",
                "┘",
                "─",
                "└",
                "│",
            },
            winhighlight = "Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None",
        },
        documentation = {
            border = {
                "┌",
                "─",
                "┐",
                "│",
                "┘",
                "─",
                "└",
                "│",
            },
            winhighlight = "Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None",
        },
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-c>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lua" },
        { name = "nvim_lsp" },
        { name = "nvim_lsp_signature_help" },
        { name = "luasnip" },
        { name = "path" },
    }, {
        { name = "buffer" },
    }),
    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
    },
})

luasnip.filetype_extend("django-html", { "html" })
luasnip.filetype_extend("ejs", { "html" })
luasnip.filetype_extend("handlebars", { "html" })
luasnip.filetype_extend("hbs", { "html" })
luasnip.filetype_extend("htmldjango", { "html" })
luasnip.filetype_extend("javascript", { "html" })
luasnip.filetype_extend("javascriptreact", { "html" })
luasnip.filetype_extend("pug", { "html" })
luasnip.filetype_extend("typescript", { "html" })
luasnip.filetype_extend("typescriptreact", { "html" })
