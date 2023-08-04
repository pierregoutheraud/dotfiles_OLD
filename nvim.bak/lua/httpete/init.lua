-- vim
require('httpete.base')

print('hello world')

if vim.g.vscode then
  -- VsCode extension

  -- Yank to clipboard
  vim.o.clipboard = 'unnamedplus'

  require('httpete.vscode.remap')

else
  -- Ordinary Neovim

  -- plugin manager
  require('httpete.packer')

  -- keymaps
  require('httpete.remap')

  -- autocommands
  require('httpete.autocommands')

  ---- Plugins
  require('httpete.plugins')
end
