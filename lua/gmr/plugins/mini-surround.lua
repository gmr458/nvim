return {
    'nvim-mini/mini.surround',
    event = 'InsertEnter',
    version = false,
    config = function()
        require('mini.surround').setup {}
    end,
}
