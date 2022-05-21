local status_ok, nvim_gps = pcall(require, "nvim-gps")

if not status_ok then
    return
end

nvim_gps.setup()
