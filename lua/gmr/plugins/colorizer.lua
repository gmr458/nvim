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
                names = false,
                RGB = true,
                RGBA = true,
                RRGGBB = true,
                RRGGBBAA = true,
                AARRGGBB = true,
                rgb_fn = true,
                hsl_fn = true,
                oklch_fn = true,
                css = true,
                css_fn = true,
                tailwind = true,
                mode = 'virtualtext',
                virtualtext = ' ██',
            },
        }
    end,
}
