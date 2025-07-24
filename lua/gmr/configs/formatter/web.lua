return function()
    local prettier_config_files = {
        '.prettierrc',
        '.prettierrc.json',
        '.prettierrc.yml',
        '.prettierrc.yaml',
        '.prettierrc.json5',
        '.prettierrc.js',
        'prettier.config.js',
        '.prettierrc.mjs',
        'prettier.config.mjs',
        '.prettierrc.cjs',
        'prettier.config.cjs',
        '.prettierrc.toml',
    }

    local prettier_config_file_exists = false

    for _, config_file in pairs(prettier_config_files) do
        if vim.uv.fs_stat(config_file) then
            prettier_config_file_exists = true
            break
        end
    end

    if prettier_config_file_exists then
        return {
            exe = 'prettier',
            args = {
                '--stdin-filepath',
                vim.fn.shellescape(vim.api.nvim_buf_get_name(0)),
            },
            stdin = true,
        }
    end

    if not vim.uv.fs_stat 'biome.json' then
        return {
            exe = 'biome',
            args = {
                'format',
                '--indent-width',
                vim.bo.tabstop,
                '--indent-style',
                vim.o.expandtab and 'space' or 'tab',
                '--stdin-file-path',
                vim.fn.shellescape(vim.api.nvim_buf_get_name(0)),
            },
            stdin = true,
        }
    end

    return {
        exe = 'biome',
        args = {
            'format',
            '--stdin-file-path',
            vim.fn.shellescape(vim.api.nvim_buf_get_name(0)),
        },
        stdin = true,
    }
end
