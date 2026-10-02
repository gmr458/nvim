local M = {}

local direction = {
    ['h'] = 'left',
    ['j'] = 'bottom',
    ['k'] = 'top',
    ['l'] = 'right',
}

--- @param hjkl 'h'|'j'|'k'|'l'
function M.nav(hjkl)
    local target_winnr = vim.fn.winnr('1' .. hjkl)
    if vim.fn.winnr() ~= target_winnr then
        vim.schedule(function()
            vim.api.nvim_command('wincmd ' .. hjkl)
        end)
    else
        local cmd = 'kitty @ kitten navigate_kitty.py ' .. direction[hjkl]
        vim.fn.system(cmd)
    end
end

return M
