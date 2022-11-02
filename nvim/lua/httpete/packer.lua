-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Theme
  use 'folke/tokyonight.nvim'
  use 'bluz71/vim-nightfly-guicolors'
  use { "mangeshrex/everblush.vim" }

  -- Tmux
  -- use("aserowy/tmux.nvim")
  -- use("andersevenrud/cmp-tmux")

  -- File tree explorer
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {}
    end
  }
  use("stevearc/dressing.nvim")
  use("stevearc/aerial.nvim")
  use 'fedepujol/move.nvim'

  -- cursor under occurences of word
  use("yamatsum/nvim-cursorline")

  -- LSP
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  use("nvim-treesitter/nvim-treesitter-textobjects")
  use 'neovim/nvim-lspconfig'
  use("williamboman/nvim-lsp-installer")

  -- Errors diagnostics
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
    end
  }

  -- CMP

  --nvim-cmp + cmp-nvim-lsp provide access to definition, references, type
  use 'hrsh7th/nvim-cmp' -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/cmp-nvim-lsp' -- completion engine plugin for neovim written in Lua

  -- plugins below provides cmp with pictograms (like vs code)
  use 'onsails/lspkind.nvim'
  use({ "L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*" })
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'glepnir/lspsaga.nvim'
  use 'ray-x/lsp_signature.nvim'

  -- autopairs
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  -- Tabs
  use { 'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons' }

  -- Formatting
  --use { 'mhartington/formatter.nvim' }
  --use('jose-elias-alvarez/null-ls.nvim')
  --use('MunifTanjim/prettier.nvim')
  --use('neovim/nvim-lspconfig')
  use('jose-elias-alvarez/null-ls.nvim')
  use('MunifTanjim/prettier.nvim')

  -- Comment
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  -- Windows not focused are faded
  --use 'sunjon/shade.nvim'
  --use('TaDaa/vimade')


  -- hover providers
  -- use { "lewis6991/hover.nvim" }

  -- Fuzzy finder
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  -- Status line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Surround code with { [ "
  -- shift+s+)
  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({})
    end
  })

  use({ "phaazon/hop.nvim", branch = "v2" })

  use("nvim-pack/nvim-spectre")

  use("mg979/vim-visual-multi")

  -- Colorize hex
  use 'NvChad/nvim-colorizer.lua'

  -- Git gutter
  use 'airblade/vim-gitgutter'
end)
