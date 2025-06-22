vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup(
        'gmr_go_to_source_definition_ts',
        { clear = true }
    ),
    callback = function()
        vim.keymap.set(
            'n',
            'gD',
            require('gmr.configs.lsp.ts_ls').go_to_source_definition
        )
    end,
})

vim.keymap.set('v', '<leader>l', function()
    local esc = vim.api.nvim_replace_termcodes('<Esc>', true, true, true)
    local keys = 'yoconsole.log("' .. esc .. 'pA:", ' .. esc .. 'pA);' .. esc
    return vim.fn.feedkeys(keys, 'n')
end, {
    desc = 'console.log() for text selected in visual mode',
    buffer = true,
    noremap = true,
})
