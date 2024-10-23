return {
    "ThePrimeagen/harpoon",
    lazy = false,
    branch = "harpoon2",
    enabled=false,
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup({
            terms = {
                settings = {
                    save_on_toggle = false,
                    select_with_nil = false,
                    sync_on_ui_close = false,
                },
            },
        })
        -- require("utils.harpoon")
        --         harpoon.setup({ enter_on_sendcmd = true })
        -- function harpoon.toggle_term_window()
        --     local win_info = vim.fn.getwininfo()
        --     local current_mode = vim.fn.mode()
        --     for k in pairs(win_info) do
        --         if win_info[k].terminal == 1 then
        --             vim.api.nvim_win_close(win_info[k].winid, nil)
        --             return
        --         end
        --     end
        --     local cur_window = vim.fn.winnr()
        --     vim.cmd([[botright split]])
        --     require("harpoon.term").gotoTerminal(1)
        --     vim.fn.execute("norm G")
        --     vim.fn.execute(tostring(cur_window) .. " wincmd w")
        --     if current_mode ~= "i" then
        --         vim.fn.execute("stopinsert")
        --     end
        -- end

    end,
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
}
