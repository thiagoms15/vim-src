return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  -- themes
  use 'morhetz/gruvbox'
  use 'EdenEast/nightfox.nvim'

  -- icons
  use 'ryanoasis/vim-devicons'
  use 'preservim/nerdtree'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'

  -- utils
  use 'sheerun/vim-polyglot'
  use 'APZelos/blamer.nvim'
  use 'ntpeters/vim-better-whitespace'
  use 'dominikduda/vim_current_word'
  use 'kamykn/spelunker.vim'
  use 'Yggdroot/indentLine'
  use 'norcalli/nvim-colorizer.lua'
  use 'ThePrimeagen/harpoon'

  -- Telescope
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'

  -- Lint LSP Comp.
--  use 'w0rp/ale'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  -- work
  use 'nathanalderson/yang.vim'
-- use 'aklt/plantuml-syntax'
-- use 'tyru/open-browser.vim'
-- use 'weirongxu/plantuml-previewer.vim'

  -- misc
  use 'airblade/vim-rooter'
  use 'voldikss/vim-floaterm'
  use 'mg979/vim-visual-multi'
  end)
