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
    colors = {
        red = "#f65866",
        orange = "#dd9046",
        yellow = "#efbd5d",
        green = "#8bcd5b",
        cyan = "#34bfd0",
        blue = "#41a7fc",
        purple = "#c75ae8",
    }, -- Override default colors
    highlights = {
        rainbowcol1 = { fg = "$red" },
        rainbowcol2 = { fg = "$orange" },
        rainbowcol3 = { fg = "$yellow" },
        rainbowcol4 = { fg = "$green" },
        rainbowcol5 = { fg = "$cyan" },
        rainbowcol6 = { fg = "$blue" },
        rainbowcol7 = { fg = "$purple" },
    }, -- Override highlight groups
    diagnostics = {
        darker = true, -- darker colors for diagnostic
        undercurl = true, -- use undercurl instead of underline for diagnostics
        background = true, -- use background color for virtual text
    },
})

onedark.load()
