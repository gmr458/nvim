return {
    'nvim-mini/mini.surround',
    event = { 'BufReadPost', 'BufNewFile' },
    version = false,
    config = function()
        require('mini.surround').setup {}
    end,
}
