call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'airblade/vim-rooter'
Plug 'w0rp/ale'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'APZelos/blamer.nvim'
Plug 'voldikss/vim-floaterm'
"Plug 'ThePrimeagen/vim-be-good'
Plug 'ntpeters/vim-better-whitespace'
Plug 'mg979/vim-visual-multi'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nathanalderson/yang.vim'
Plug 'Yggdroot/indentLine'
Plug 'dominikduda/vim_current_word'
Plug 'kamykn/spelunker.vim'
call plug#end()

syntax on

set guicursor=
set cursorline
set number
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

colorscheme gruvbox
set background=dark

"set mouse=a

set inccommand=split
set clipboard=unnamedplus

set encoding=UTF-8

let mapleader="\<space>"

"call fzf#run({ 'source': 'ls' })
"call fzf#run(fzf#wrap({ 'source': 'ls' }))
"call fzf#run(fzf#vim#with_preview(fzf#wrap({ 'source': 'ls' })))
"
"" See how these decorators "decorate" (or "extend") the dictionary
"echo fzf#wrap({ 'source': 'ls' })
"echo fzf#vim#with_preview(fzf#wrap({ 'source': 'ls' }))

"let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4 --preview 'bat --color=always --style=header,grid --line-range :300 {}'"
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --no-index --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({ 'dir': systemlist('git rev-parse --show-toplevel')[0] }), <bang>0)

nnoremap <leader>; A;<esc>
"nnoremap <c-p> :Files<cr>
"nnoremap <c-f> :Ag<space>
"nnoremap <c-f> :GGrep<space>
nnoremap <c-s> :w<cr>

map <C-b> :NERDTreeToggle<cr>

nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>rp :resize 100<CR>

let g:blamer_enabled = 1

" enable powerline fonts
let g:airline_powerline_fonts = 1
"let g:airline_left_sep = ''
"let g:airline_right_sep = ''

" Switch to your current theme
let g:airline_theme = 'onedark'

let g:airline#extensions#tabline#enabled = 1

" Always show tabs
"set showtabline=2

nnoremap   <silent>   <C-t>   :FloatermToggle<CR>
tnoremap   <silent>   <C-t>   <C-\><C-n>:FloatermToggle<CR>

highlight! link NERDTreeFlags NERDTreeDir

" Using lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
