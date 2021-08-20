source $HOME/.config/nvim/configs/plugins.vimrc
source $HOME/.config/nvim/configs/general.vimrc
source $HOME/.config/nvim/configs/functions.vimrc
source $HOME/.config/nvim/configs/telescope.vimrc

map <C-b> :NERDTreeToggle<cr>

nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>rp :resize 100<CR>

let g:blamer_enabled = 1

" enable powerline fonts
let g:airline_powerline_fonts = 1

" Switch to your current theme
let g:airline_theme = 'onedark'

let g:airline#extensions#tabline#enabled = 1

nnoremap   <silent>   <C-t>   :FloatermToggle<CR>
tnoremap   <silent>   <C-t>   <C-\><C-n>:FloatermToggle<CR>

highlight! link NERDTreeFlags NERDTreeDir

