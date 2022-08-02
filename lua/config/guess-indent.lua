local guess_indent_loaded, guess_indent = pcall(require, "guess-indent")

if guess_indent_loaded == false then
    print("guess-indent not loaded")
    return
end

guess_indent.setup({})
