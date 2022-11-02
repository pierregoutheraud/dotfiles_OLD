local n_noremap = require("httpete.keymap").n_noremap
local x_noremap = require("httpete.keymap").x_noremap

--n_noremap("<leader>e", "<cmd>Ex<CR>")
--n_noremap("<leader>m", "<cmd>:BuffNext<CR>")
--n_noremap("<leader>n", "<cmd>:BuffPrev<CR>")

-- Open left window
--n_noremap("<leader>l", ":wincmd w<CR>")
-- Open right window
--n_noremap("<leader>h", ":wincmd W<CR>")
-- Open new split window and focus it
--n_noremap("<leader>v", ":wincmd v<CR>:wincmd w<CR>")
n_noremap("<leader>v", ":wincmd v<CR>:wincmd w<CR>") -- open v split
n_noremap("<leader>h", ":sp<CR>:wincmd w<CR>") -- open h split
-- Close window
--n_noremap("<leader>q", ":wincmd q<CR>")

-- Open fuzzy finder
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>p', builtin.find_files, {})

--vim.keymap.set('n', '<leader>?', builtin.live_grep, {})
--vim.keymap.set('n', 'fb', builtin.buffers, {})
--vim.keymap.set('n', 'fh', builtin.help_tags, {})

--vim.keymap.set("n", "<leader>q", ":bd<CR>")

-- go to tab
n_noremap("<leader>1", ":BufferLineGoToBuffer 1<CR>")
n_noremap("<leader>2", ":BufferLineGoToBuffer 2<CR>")
n_noremap("<leader>3", ":BufferLineGoToBuffer 3<CR>")
n_noremap("<leader>4", ":BufferLineGoToBuffer 4<CR>")
n_noremap("<leader>5", ":BufferLineGoToBuffer 5<CR>")
n_noremap("<leader>6", ":BufferLineGoToBuffer 6<CR>")
n_noremap("<leader>7", ":BufferLineGoToBuffer 7<CR>")
n_noremap("<leader>8", ":BufferLineGoToBuffer 8<CR>")
n_noremap("<leader>9", ":BufferLineGoToBuffer 8<CR>")
-- close buffer
--n_noremap("<leader>q", ":bdelete<CR>")

-- previous tab
--vim.keymap.set("n", "<leader>w", ":bp<CR>")
-- vim.keymap.set("n", "<C-1>", ":bp<CR>")
-- next tab
--vim.keymap.set("n", "<leader>e", ":bn<CR>")
-- vim.keymap.set("n", "<C-2>", ":bn<CR>")
--n_noremap("<C-2>", ":bn<CR>")

-- Hop search
vim.keymap.set("n", "<Leader>y", require("hop").hint_words)

-- Navigate through vim windows
-- done with tmux plugin for now
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
-- -- Close window
vim.keymap.set("n", "<C-q>", "<C-w>q", { noremap = true, silent = true })

-- Search all
n_noremap("<leader>f", "<cmd>lua require('spectre').open()<CR>")
-- n_noremap("<leader>sw", "<cmd>lua require('spectre').open_visual({select_word=true})<CR>")
-- n_noremap("<leader>s", "<esc>:lua require('spectre').open_visual()<CR>")
-- n_noremap("<leader>S", "<cmd>lua require('spectre').open()<CR>")
-- n_noremap("<leader>sp", "viw:lua require('spectre').open_file_search()<cr>")

-- Toggle file tree
vim.keymap.set("n", "<leader>b", "<cmd>:NvimTreeFindFileToggle<CR>")

-- move
vim.keymap.set("n", "<A-k>", ":MoveLine(-1)<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-j>", ":MoveLine(1)<CR>", { noremap = true, silent = true })
vim.keymap.set("v", "<A-k>", ":MoveBlock(-1)<CR>", { noremap = true, silent = true })
vim.keymap.set("v", "<A-j>", ":MoveBlock(1)<CR>", { noremap = true, silent = true })

-- When going at bottom, center cursor -> so that I have padding
vim.keymap.set("n", "G", "Gzz", { noremap = true })

-- Remove yank on x
vim.keymap.set("v", "x", '"_x', { noremap = true })

-- Resize
-- vim.keymap.set("n", "<A-l>", ":vertical resize +10<CR>", { noremap = true })
-- vim.keymap.set("n", "<A-h>", ":vertical resize -10<CR>", { noremap = true })

-- Copy file path to yank
--vim.keymap.set('n', 'cp', ':let @" = expand("%")<CR>', { noremap = true })
-- Copy full file path to clipboard
vim.keymap.set('n', 'cp', ':let @+ = expand("%:p")<CR>', { noremap = true })

-- Cycle through tabs
vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})

-- New tab + Fuzzy finder
vim.keymap.set('n', 'tn', ':tabedit<CR>:Telescope find_files<CR>', { noremap = true })
vim.keymap.set('n', 'tq', ':tabclose<CR>', { noremap = true })

-- Close tab
--n_noremap("<leader>q", ":tabclose")
-- vim.keymap.set('n', '<leader>p', builtin.find_files, {})

-- Select all
vim.keymap.set('n', '<C-a>', 'gg<S-v>G', { noremap = true })

-- Prevent yanking when pasting in visual mode
x_noremap('p', 'pgvy')
