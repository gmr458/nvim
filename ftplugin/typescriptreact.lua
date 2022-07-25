local options = {
    shiftwidth = 2,
    tabstop = 2,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end
