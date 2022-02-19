local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

telescope.setup({
    defaults = {
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
        },
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
        prompt_title = false,
        file_ignore_patterns = {
            ".git/",
            "node_modules/",
            "dist/",
            "build/",
            "venv/",
            "bin/",
            "obj/",
            "target/",
            ".exe",
            "__pycache__/",
            ".vscode/",
        },
        color_devicons = true,
        set_env = { ["COLORTERM"] = "truecolor" },
        path_display = { "shorten" },
    },
})

if vim.fn.has("win32") ~= 1 then
    telescope.load_extension("fzf")
    telescope.load_extension("file_browser")
    telescope.load_extension("media_files")
end
