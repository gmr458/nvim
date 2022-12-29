if vim.fn.has("win32") == 1 then
    local bin_name = "pyright-langserver.cmd"
    local cmd = { "cmd.exe", "C", bin_name, "--stdio" }
else
    return nil
end
