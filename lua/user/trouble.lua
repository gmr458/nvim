local status_ok, trouble = pcall(require, "catppuccin")
if not status_ok then
    return
end

trouble.setup()
