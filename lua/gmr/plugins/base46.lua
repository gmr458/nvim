return {
    'NvChad/base46',
    lazy = true,
    build = ':lua require(\'base46\').load_all_highlights()',
    dependencies = { 'nvim-lua/plenary.nvim' },
}
