print("Filetype: " .. vim.bo.filetype)
print("g:colors_name: " .. (vim.g.colors_name or "nil"))
print("Treesitter active: " .. tostring(vim.treesitter.highlighter.active[0] ~= nil))
print("Syntax on: " .. tostring(vim.g.syntax_on == 1))

local function check_hl(name)
    local hl = vim.api.nvim_get_hl(0, { name = name })
    print("Highlight " .. name .. ": " .. vim.inspect(hl))
end

check_hl("Normal")
check_hl("@variable")
check_hl("@function")
check_hl("Function")
check_hl("Keyword")
check_hl("@keyword")

local ok, configs = pcall(require, "nvim-treesitter.configs")
print("nvim-treesitter.configs loaded: " .. tostring(ok))

if ok then
    local ts_info = configs.get_module("highlight")
    print("Treesitter highlight module config: " .. (ts_info and tostring(ts_info.enable) or "nil"))
end
