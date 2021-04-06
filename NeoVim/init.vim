" LAVENROSE VIM CONFIGURATION

" ------ KEYBINDS ------
noremap u k
noremap k l
noremap l u

nnoremap <C-a> :NERDTreeToggle<CR>

" ------ PLUGS ------
call plug#begin('~/.config/nvim/plugins')

Plug 'arcticicestudio/nord-vim'
Plug 'frazrepo/vim-rainbow'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

call plug#end()

" ----- CMD CALLS -----
colorscheme nord
let g:rainbow_active = 1
let g:lightline = {
	\ 'colorscheme': 'wombat',
	\ }
set relativenumber
set rnu
