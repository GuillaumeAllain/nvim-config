--- packer install
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim | lua require('packer_setup').sync()]])
end

vim.o.guifont = "SFmono Nerd Font:h15"

vim.opt.background =
    vim.fn.system("head -1 " .. vim.fn.expand("$XDG_CACHE_HOME/kitty/nvim_theme.conf")):gsub("\n", ""):sub(3)

require("impatient")

require("neovide")

require("settings")

require("keymaps")
