-- https://github.com/vscode-neovim/vscode-neovim/issues/199#issuecomment-640284496
if vim.g.vscode then
    vim.api.nvim_set_keymap('x', '<C-/>', '<Plug>VSCodeCommentarygv', {})
    vim.api.nvim_set_keymap('n', '<C-/>', '<Plug>VSCodeCommentaryLinegv', {})
end

-- Prevent pasting to be saved in yank:
-- When we yank and then select a text and p it won't yank the selected text but keep the original yank.
vim.keymap.set("x", "p", '"_dP')

-- Prevent deleting into the system clipboard
-- Typing x will not yank the deleted text into the system clipboard
vim.keymap.set("n", "x", '"_x')

-- Try to set an history of yanks (LAGS)
-- vim.keymap.set("n", "y", ':let @a=@0<CR>y', { silent = false, noremap = true })
-- vim.keymap.set("v", "y", ':let @a=@0<CR>y', { silent = false, noremap = true })
-- vim.keymap.set("x", "y", ':let @a=@0<CR>y', { silent = false, noremap = true })