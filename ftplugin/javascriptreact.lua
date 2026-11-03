-- Buffer-local `gD` -> go to source definition.
-- Disabled for now, but kept as a reference for future use.
-- Changes vs. the previous global version: the autocmd and the keymap are
-- buffer-local (`buffer = bufnr`), each filetype has its own augroup, and the
-- `clear = true` option was removed so opening one JS/TS filetype no longer
-- wipes the autocmds created by another.
-- local bufnr = vim.api.nvim_get_current_buf()
--
-- vim.api.nvim_create_autocmd('LspAttach', {
--     group = vim.api.nvim_create_augroup('gmr_go_to_source_definition_jsx', {}),
--     buffer = bufnr,
--     desc = 'Go to source definition for JavaScriptReact',
--     callback = function()
--         vim.keymap.set(
--             'n',
--             'gD',
--             require('gmr.configs.lsp.ts_ls').go_to_source_definition,
--             { buffer = bufnr, desc = 'Go to source definition' }
--         )
--     end,
-- })

vim.keymap.set('v', '<leader>l', function()
    local esc = vim.api.nvim_replace_termcodes('<Esc>', true, true, true)
    local keys = 'yoconsole.log("' .. esc .. 'pA:", ' .. esc .. 'pA);' .. esc
    return vim.fn.feedkeys(keys, 'n')
end, {
    desc = 'console.log() for text selected in visual mode',
    buffer = true,
    noremap = true,
})
