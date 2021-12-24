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
        layout_config = {
            preview_width = 0.7,
            width = 0.9,
            height = 0.9,
        },
        prompt_title = false,
        file_ignore_patterns = {
            "node_modules",
            "dist",
            "build",
            "venv",
            "/bin/",
            "obj",
            "target",
            ".exe",
            "__pycache__",
        },
        color_devicons = true,
        set_env = { ["COLORTERM"] = "truecolor" },
        path_display = { "shorten" },
    },
    extensions = {},
})