source $HOME/.config/nvim/configs/plugins.vimrc
source $HOME/.config/nvim/configs/general.vimrc
source $HOME/.config/nvim/configs/mapping.vimrc
source $HOME/.config/nvim/configs/functions.vimrc
source $HOME/.config/nvim/configs/telescope.vimrc

let g:blamer_enabled = 1

" enable powerline fonts
let g:airline_powerline_fonts = 1

" Switch to your current theme
let g:airline_theme = 'onedark'

let g:airline#extensions#tabline#enabled = 1

highlight! link NERDTreeFlags NERDTreeDir
