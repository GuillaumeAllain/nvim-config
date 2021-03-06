vim.cmd[[
    setlocal expandtab
    setlocal shiftwidth=4
    setlocal softtabstop=4
]]

local lineno = vim.fn.search([[---\_.*\zs\(^lang:.*$\)\ze\_.*---]],"n")
if lineno ~= 0 then
    local lines = vim.api.nvim_buf_get_lines(0, lineno-1, lineno, false)
    if lines ~= {} then
        for s in lines[1]:gmatch("lang:%s*(.*)") do
            if s ~= "" then
                vim.cmd("setlocal spelllang="..s)
            end
        end
    end
end

require('which-key').register({
    ['f'] = {
        l = {
            "<cmd>Telescope heading<cr>",
            "Lsp document symbols",
        },
    },
}, {
    buffer = vim.api.nvim_get_current_buf(), --- pass buffer number in option then it will work
    prefix = '<leader>',
})
