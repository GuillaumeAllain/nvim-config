vim.cmd[[
    setlocal expandtab
    setlocal shiftwidth=4
    setlocal softtabstop=4
]]

local result = vim.api.nvim_exec("execute 'g/lang:'|noh|norma``", true)
local resulttable = {}
for s in result:gmatch("[^\r\n]+") do
    resulttable[#resulttable + 1] = s
end
if resulttable ~= {} then
    for s in resulttable[1]:gmatch(".*:%s*(.*)") do
        vim.cmd("setlocal spelllang="..s)
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
