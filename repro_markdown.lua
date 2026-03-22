local buf = vim.api.nvim_create_buf(false, true)
vim.api.nvim_buf_set_option(buf, "filetype", "markdown")
vim.api.nvim_set_current_buf(buf)

print("Filetype: " .. vim.bo.filetype)
print("Treesitter active: " .. tostring(vim.treesitter.highlighter.active[buf] ~= nil))
print("Syntax on: " .. tostring(vim.g.syntax_on == 1))

local ok, configs = pcall(require, "nvim-treesitter.configs")
if ok then
    local ts_info = configs.get_module("highlight")
    print("Treesitter highlight module info: " .. (ts_info and tostring(ts_info.enable) or "nil"))
end

local parsers = require("nvim-treesitter.parsers")
print("Is markdown parser installed: " .. tostring(parsers.has_parser("markdown")))
