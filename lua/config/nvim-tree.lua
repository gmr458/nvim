vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_special_files = {}
vim.g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1,
    folder_arrows = 1,
}
vim.g.nvim_tree_icons = {
    default = "",
    symlink = "",
    git = {
        unstaged = "M",
        staged = "A",
        unmerged = "U",
        renamed = "R",
        untracked = "?",
        deleted = "D",
        ignored = "◌",
    },
    folder = {
        arrow_open = "",
        arrow_closed = "",
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = "",
        symlink_open = "",
    },
}

local status_ok, nvim_tree = pcall(require, "nvim-tree")

if not status_ok then
    return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")

if not config_status_ok then
    return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup({
    disable_netrw = true,
    hijack_cursor = true,
    view = {
        hide_root_folder = true,
        mappings = {
            list = {
                { key = "s", cb = tree_cb("vsplit") },
                { key = "z", cb = tree_cb("") },
                { key = "m", cb = tree_cb("") },
            },
        },
    },
    renderer = { indent_markers = { enable = true } },
    filters = {
        custom = { ".git", "node_modules" },
        exclude = { ".gitignore" },
    },
    git = { ignore = false },
    actions = {
        open_file = {
            window_picker = {
                exclude = {
                    filetype = {
                        "notify",
                        "packer",
                        "qf",
                        "diff",
                        "fugitive",
                        "fugitiveblame",
                    },
                    buftype = { "nofile", "terminal", "help" },
                },
            },
        },
    },
})
