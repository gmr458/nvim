local status_ok, telescope = pcall(require, "telescope")

if not status_ok then
    return
end

local action_layout = require("telescope.actions.layout")

telescope.setup({
    defaults = {
        mappings = {
            n = {
                ["<C-p>"] = action_layout.toggle_preview,
            },
            i = {
                ["<C-p>"] = action_layout.toggle_preview,
            },
        },
        prompt_prefix = "   ",
        selection_caret = "  ",
        layout_config = {
            preview_width = 0.7,
            width = 0.9,
            height = 0.9,
        },
        borderchars = {
            "─",
            "│",
            "─",
            "│",
            "┌",
            "┐",
            "┘",
            "└",
        },
        file_ignore_patterns = {
            ".git/",
            ".git\\",
            "node_modules",
            "dist",
            "build",
            "venv",
            "bin",
            "obj",
            "target",
            ".exe",
            "__pycache__",
            ".vscode",
            "vendor",
        },
        color_devicons = true,
        set_env = { ["COLORTERM"] = "truecolor" },
        extensions = {
            media_files = {
                find_cmd = "rg",
                filetypes = { "jpeg" },
            },
        },
    },
    pickers = {
        find_files = {
            previewer = false,
        },
        oldfiles = {
            previewer = false,
        },
    },
})

if vim.fn.has("win32") ~= 1 then
    telescope.load_extension("fzf")
    telescope.load_extension("file_browser")
    telescope.load_extension("media_files")
end
