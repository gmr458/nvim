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
        multi_icon = "",
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
            fzf = {
                fuzzy = true, -- false will only do exact matching
                override_generic_sorter = true, -- override the generic sorter
                override_file_sorter = true, -- override the file sorter
                case_mode = "smart_case", -- or "ignore_case" or "respect_case" the default case_mode is "smart_case"
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

telescope.load_extension("fzf")
