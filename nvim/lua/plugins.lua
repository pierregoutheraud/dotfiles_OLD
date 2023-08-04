-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- use 'gbprod/yanky.nvim'

  -- Keep cursor position on yank
  use'svban/YankAssassin.vim' 

  -- Night owl theme
  use("oxfist/night-owl.nvim")

end)
