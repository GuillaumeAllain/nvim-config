if vim.loader then
    vim.loader.enable()
end

_G.start_time = vim.uv.hrtime()
_G.benchmark_results = {}
_G.log_benchmark = function(name)
  table.insert(_G.benchmark_results, {name = name, time = (vim.uv.hrtime() - _G.start_time) / 1e6})
end
_G.log_benchmark("Init start")

-- Plugins are managed by the built-in vim.pack (Neovim 0.12+). The loader lives
-- in lua/config/plugins/init.lua, invoked from lua/config/init.lua.
require("config")
