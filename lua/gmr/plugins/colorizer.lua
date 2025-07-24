return {
    'catgoose/nvim-colorizer.lua',
    cmd = 'ColorizerToggle',
    config = function()
        require('colorizer').setup {
            filetypes = {
                'conf',
                'css',
                'html',
                'javascript',
                'typescript',
                'json',
                'jsonc',
                'lua',
                'yaml',
            },
            user_default_options = {
                RGB = true,
                RRGGBB = true,
                names = false,
                RRGGBBAA = true,
                AARRGGBB = true,
                rgb_fn = true,
                hsl_fn = true,
                css = true,
                css_fn = true,
                mode = 'virtualtext',
                tailwind = true,
                virtualtext = ' ██',
            },
        }
    end,
}
