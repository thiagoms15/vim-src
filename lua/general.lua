local set = vim.opt
HOME = os.getenv("HOME")

vim.g.mapleader=' '

set.encoding = 'UTF-8'

set.mouse      =''
set.guicursor  = ''
set.cursorline = true

set.relativenumber = true
set.nu             = true

set.hlsearch   = false
set.hidden     = true
set.errorbells = false

set.tabstop     = 4
set.softtabstop = 4
set.shiftwidth  = 4
set.expandtab   = true
set.smartindent = true

set.wrap          = false
set.smartcase     = true
set.swapfile      = false
set.backup        = false
set.undodir       = HOME .. "/.vim/undodir"
set.undofile      = true
set.incsearch     = true
set.termguicolors = true
set.scrolloff     = 8
set.showmode      = false
--set.completeopt   = {'menuone','noinsert','noselect'}
set.completeopt   = {'menu', 'menuone', 'noselect'}

--" Give more space for displaying messages.
set.cmdheight = 2

--" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
--" delays and poor user experience.
set.updatetime = 50

--" Don't pass messages to |ins-completion-menu|.
--set shortmess+=c

set.colorcolumn = '80'
vim.cmd('highlight ColorColumn ctermbg=0 guibg=lightgrey')

-- vim.cmd('colorscheme gruvbox')
-- vim.cmd('colorscheme nordfox')
--set.background = 'dark'

set.inccommand = 'split'
--vim.cmd('set clipboard+=unnamedplus')

-- airline
--vim.cmd('let g:airline#extensions#tabline#enabled = 1')
--vim.cmd('let g:airline_powerline_fonts = 1')
--vim.cmd("let g:airline_theme = 'onedark'")

-- blame
vim.cmd('let g:blamer_enabled = 1')
vim.cmd('let g:blamer_show_in_visual_modes = 0')
