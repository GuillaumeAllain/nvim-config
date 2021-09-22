-- packer install
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim | lua require('packer_setup').sync()]])
end
-- lazy packer commands
vim.cmd([[command! PackerInstall packadd packer.nvim | lua require('packer_setup').install()]])
vim.cmd([[command! PackerUpdate packadd packer.nvim | lua require('packer_setup').update()]])
vim.cmd([[command! PackerSync packadd packer.nvim | lua require('packer_setup').sync()]])
vim.cmd([[command! PackerClean packadd packer.nvim | lua require('packer_setup').clean()]])
vim.cmd([[command! PackerCompile packadd packer.nvim | lua require('packer_setup').compile()]])
vim.cmd([[command! PackerProfile packadd packer.nvim | lua require('packer_setup').profile_output()]])

require("settings")

require('keymaps')
