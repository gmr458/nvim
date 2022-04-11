local status_ok, telescope = pcall(require, "telescope")

if not status_ok then
    return
end

telescope.setup({
    defaults = {
        prompt_prefix = "   ",
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
    },
})

if vim.fn.has("win32") ~= 1 then
    telescope.load_extension("fzf")
    telescope.load_extension("file_browser")
    telescope.load_extension("media_files")
end
