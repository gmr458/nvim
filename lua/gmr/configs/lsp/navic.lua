local M = {}

--- @param client vim.lsp.Client
--- @param bufnr integer
function M.attach(client, bufnr)
    if client:supports_method 'textDocument/documentSymbol' then
        local filetype = vim.bo.filetype

        if
            client.name == 'html'
            and (filetype == 'javascriptreact' or filetype == 'typescriptreact')
        then
            return
        end

        local ok_navic, navic = pcall(require, 'nvim-navic')
        if not ok_navic then
            vim.notify 'nvim-navic could not be loaded'
            return
        end

        navic.attach(client, bufnr)
    end
end

return M
