local status_ok, onedark = pcall(require, "onedark")

if not status_ok then
    return
end

onedark.setup({
    style = "deep", -- Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
    transparent = false,
    term_colors = true,
    ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
    toggle_style_key = "<leader>ts",
    toggle_style_list = {
        "dark",
        "darker",
        "cool",
        "deep",
        "warm",
        "warmer",
        "light",
    },
    code_style = {
        comments = "italic",
        keywords = "none",
        functions = "none",
        strings = "none",
        variables = "none",
    },
    colors = {}, -- Override default colors
    highlights = {
        rainbowcol1 = { fg = "#ffd700" },
        rainbowcol2 = { fg = "#ff0084" },
    }, -- Override highlight groups
    diagnostics = {
        darker = false, -- darker colors for diagnostic
        undercurl = true, -- use undercurl instead of underline for diagnostics
        background = false, -- use background color for virtual text
    },
})

onedark.load()
