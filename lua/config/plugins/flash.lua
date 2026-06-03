vim.keymap.set({ "n", "x", "o" }, "sf", function()
    -- default options: exact mode, multi window, all directions, with a backdrop
    require("flash").jump()
end)
vim.keymap.set({ "n", "o", "x" }, "S", function()
    require("flash").treesitter()
end)
