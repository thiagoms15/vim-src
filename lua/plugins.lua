return require('packer').startup(function()
  -- package management
  use 'wbthomason/packer.nvim'
  use "williamboman/mason.nvim"

  -- themes
  use 'goolord/alpha-nvim'
--  use 'morhetz/gruvbox'
--  use 'EdenEast/nightfox.nvim'
  use 'catppuccin/nvim'

  -- icons
  use 'preservim/tagbar'
  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- utils
  use 'Yggdroot/indentLine'
  use 'APZelos/blamer.nvim'
  use 'kamykn/spelunker.vim'
  use 'ThePrimeagen/harpoon'
  use 'norcalli/nvim-colorizer.lua'
  use 'dominikduda/vim_current_word'
  use 'ntpeters/vim-better-whitespace'
  use 'nvim-treesitter/nvim-treesitter'

  -- Telescope
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Lint LSP Comp.
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  -- work
  --  use 'nathanalderson/yang.vim'
  -- use 'aklt/plantuml-syntax'
  -- use 'tyru/open-browser.vim'
  -- use 'weirongxu/plantuml-previewer.vim'

  -- misc
--  use 'airblade/vim-rooter'
  use 'voldikss/vim-floaterm'
  --  use 'mg979/vim-visual-multi'
  end)
