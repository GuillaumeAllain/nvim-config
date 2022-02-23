-- packer install
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim | lua require('packer_setup').sync()]])
end

require("impatient")
vim.g.did_load_filetypes = 1

require("settings")

require('keymaps')
