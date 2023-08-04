local status, saga = pcall(require, "lspsaga")
if (not status) then return end

saga.init_lsp_saga {
  server_filetype_map = {
    typescript = 'typescript'
  }
}

local opts = { noremap = true, silent = true }
vim.keymap.set('n', 'Zq', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
vim.keymap.set('n', 'Zw', '<Cmd>Lspsaga hover_doc<CR>', opts)
vim.keymap.set('n', 'Ze', '<Cmd>Lspsaga lsp_finder<CR>', opts)

-- show definition in hover window
vim.keymap.set('n', 'Zr', '<Cmd>Lspsaga peek_definition<CR>', opts)

-- same as F2 on vscode
vim.keymap.set('n', 'Zt', '<Cmd>Lspsaga rename<CR>', opts)


vim.keymap.set('i', '<C-z>', '<Cmd>Lspsaga signature_help<CR>', opts)
