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

if cmp == nil then
    print("cmp is nil")
    return
end

local types = require("cmp.types")

local function deprioritize_snippet(entry1, entry2)
    if entry1:get_kind() == types.lsp.CompletionItemKind.Snippet then
        return false
    end
    if entry2:get_kind() == types.lsp.CompletionItemKind.Snippet then
        return true
    end
end

local function prioritize_keyword(entry1, entry2)
    if entry1:get_kind() ~= types.lsp.CompletionItemKind.Keyword then
        return false
    end
    if entry2:get_kind() ~= types.lsp.CompletionItemKind.Keyword then
        return true
    end
end

cmp.setup({
    preselect = types.cmp.PreselectMode.None,
    mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<Esc>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ["<CR>"] = cmp.mapping.confirm({
            behavior = types.cmp.ConfirmBehavior.Replace,
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
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    sorting = {
        comparators = {
            deprioritize_snippet,
            prioritize_keyword,
            -- cmp.config.compare.offset,
            cmp.config.compare.exact,
            -- cmp.config.compare.score,
            -- cmp.config.compare.recently_used,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            -- cmp.config.compare.length,
            cmp.config.compare.order,
            cmp.config.compare.locality,
            -- cmp.config.compare.scopes,
        },
    },
    sources = cmp.config.sources({
        { name = "nvim_lua" },
        { name = "nvim_lsp" },
        { name = "nvim_lsp_signature_help" },
        { name = "luasnip" },
        { name = "path" },
    }, {
        { name = "buffer" },
    }),
    confirmation = { default_behavior = types.cmp.ConfirmBehavior.Replace },
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
