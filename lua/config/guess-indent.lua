local guess_indent_loaded, guess_indent = pcall(require, "guess-indent")

if not guess_indent_loaded then
    print("guess-indent not loaded")
    return
end

guess_indent.setup({})
