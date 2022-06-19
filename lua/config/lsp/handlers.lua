local M = {}

M.servers = {
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
    "tsserver",
    "vimls",
    "yamlls",
}

M.setup = function()
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

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
        vim.lsp.handlers.hover,
        { border = borderchars }
    )

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
        vim.lsp.handlers.signature_help,
        { border = borderchars }
    )

    local lspconfig_window = require("lspconfig.ui.windows")
    local old_defaults = lspconfig_window.default_opts

    function lspconfig_window.default_opts(opts)
        local win_opts = old_defaults(opts)
        win_opts.border = borderchars
        return win_opts
    end
end

local function lsp_keymaps(bufnr)
    local opts_keymap = { noremap = true, silent = true }

    vim.api.nvim_set_keymap(
        "n",
        "<space>e",
        "<cmd>lua vim.diagnostic.open_float()<CR>",
        opts_keymap
    )
    vim.api.nvim_set_keymap(
        "n",
        "[d",
        "<cmd>lua vim.diagnostic.goto_prev()<CR>",
        opts_keymap
    )
    vim.api.nvim_set_keymap(
        "n",
        "]d",
        "<cmd>lua vim.diagnostic.goto_next()<CR>",
        opts_keymap
    )
    vim.api.nvim_set_keymap(
        "n",
        "<space>q",
        "<cmd>lua vim.diagnostic.setloclist()<CR>",
        opts_keymap
    )

    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "gD",
        "<cmd>lua vim.lsp.buf.declaration()<CR>",
        opts_keymap
    )
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "gd",
        "<cmd>lua vim.lsp.buf.definition()<CR>",
        opts_keymap
    )
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "J",
        "<cmd>lua vim.lsp.buf.hover()<CR>",
        opts_keymap
    )
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "gi",
        "<cmd>lua vim.lsp.buf.implementation()<CR>",
        opts_keymap
    )
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "<C-k>",
        "<cmd>lua vim.lsp.buf.signature_help()<CR>",
        opts_keymap
    )
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "<space>wa",
        "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>",
        opts_keymap
    )
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "<space>wr",
        "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>",
        opts_keymap
    )
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "<space>wl",
        "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
        opts_keymap
    )
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "<space>D",
        "<cmd>lua vim.lsp.buf.type_definition()<CR>",
        opts_keymap
    )
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "<space>rn",
        "<cmd>lua vim.lsp.buf.rename()<CR>",
        opts_keymap
    )
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "<space>ca",
        "<cmd>lua vim.lsp.buf.code_action()<CR>",
        opts_keymap
    )
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "gr",
        "<cmd>lua vim.lsp.buf.references()<CR>",
        opts_keymap
    )
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "<space>f",
        "<cmd>lua vim.lsp.buf.formatting()<CR>",
        opts_keymap
    )
end

local function lsp_highlight_document(client)
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

M.on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
    lsp_keymaps(bufnr)
    lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

if not status_ok then
    return
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
