local status_ok, guess_indent = pcall(require, "guess-indent")

if not status_ok then
    return
end

guess_indent.setup({})
