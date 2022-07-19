local status_lsp_installer, lsp_installer = pcall(require, "nvim-lsp-installer")

if not status_lsp_installer then
    return
end

local servers = {
    "angularls",
    "bashls",
    "clangd",
    "cssls",
    "denols",
    "dockerls",
    "emmet_ls",
    "eslint",
    "golangci_lint_ls",
    "gopls",
    "html",
    "intelephense",
    "jdtls",
    "jsonls",
    "kotlin_language_server",
    -- "omnisharp",
    "pyright",
    "rust_analyzer",
    -- "solargraph",
    "sqls",
    "sumneko_lua",
    "tailwindcss",
    "taplo",
    "tsserver",
    "vimls",
    "yamlls",
}

lsp_installer.setup({
    ensure_installed = servers,
    automatic_installation = true,
    ui = {
        icons = {
            server_installed = "✓",
            server_uninstalled = "✗",
        },
    },
})

local status_lspconfig, lspconfig = pcall(require, "lspconfig")

if not status_lspconfig then
    return
end

-- local signs = {
--     { name = "DiagnosticSignError", text = "" },
--     { name = "DiagnosticSignWarn", text = "" },
--     { name = "DiagnosticSignHint", text = "" },
--     { name = "DiagnosticSignInfo", text = "" },
-- }

local borderchars = {
    "┌",
    "─",
    "┐",
    "│",
    "┘",
    "─",
    "└",
    "│",
}

-- for _, sign in ipairs(signs) do
--     vim.fn.sign_define(
--         sign.name,
--         { texthl = sign.name, text = sign.text, numhl = "" }
--     )
-- end

local config = {
    virtual_text = true,
    signs = false,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = { border = borderchars },
}

vim.diagnostic.config(config)

vim.lsp.handlers["textDocument/hover"] =
    vim.lsp.with(vim.lsp.handlers.hover, { border = borderchars })

vim.lsp.handlers["textDocument/signatureHelp"] =
    vim.lsp.with(vim.lsp.handlers.signature_help, { border = borderchars })

local lspconfig_window = require("lspconfig.ui.windows")
local old_defaults = lspconfig_window.default_opts

function lspconfig_window.default_opts(opts)
    local win_opts = old_defaults(opts)
    win_opts.border = borderchars
    return win_opts
end

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false

    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }

    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "J", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set("n", "<space>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
    vim.keymap.set("n", "<space>f", vim.lsp.buf.formatting, bufopts)

    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_create_augroup("lsp_document_highlight", {})
        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            group = "lsp_document_highlight",
            buffer = 0,
            callback = vim.lsp.buf.document_highlight,
        })
        vim.api.nvim_create_autocmd("CursorMoved", {
            group = "lsp_document_highlight",
            buffer = 0,
            callback = vim.lsp.buf.clear_references,
        })
    end
end

local status_cmp_nvim_lsp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

if not status_cmp_nvim_lsp then
    return
end

local capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())

for _, server in pairs(servers) do
    local server_opts = {
        on_attach = on_attach,
        capabilities = capabilities,
    }

    local has_custom_opts, server_custom_opts = pcall(require, "config.lsp.settings." .. server)

    if has_custom_opts then
        server_opts = vim.tbl_deep_extend("force", server_opts, server_custom_opts)
    end

    lspconfig[server].setup(server_opts)
end
