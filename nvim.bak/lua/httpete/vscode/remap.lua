-- Remove yank on v mode
vim.keymap.set('v', 'p', '"_dP')

-- Remove yank when typing x
vim.keymap.set("v", "x", '"_x', { noremap = true })