local m = {}
local harpoon = require("harpoon")
local harpoonterm = require("harpoon.term")

function m.setup()
    harpoon.setup({ enter_on_sendcmd = true })
end

function m.toggle_term_window()
    local win_info = vim.fn.getwininfo()
    local current_mode = vim.fn.mode()
    for k in pairs(win_info) do
        if win_info[k].terminal == 1 then
            vim.api.nvim_win_close(win_info[k].winid, nil)
            return
        end
    end
    local cur_window = vim.fn.winnr()
    vim.cmd([[botright vsplit]])
    harpoonterm.gotoTerminal(1)
    vim.fn.execute("norm G")
    vim.fn.execute(tostring(cur_window) .. " wincmd w")
    if current_mode ~= "i" then
        vim.fn.execute("stopinsert")
    end
end

return m
