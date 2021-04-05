" LAVENROSE VIM CONFIGURATION

" ------ KEYBINDS ------
noremap u k
noremap k l
noremap l u

nnoremap <leader>n :NERDTreeFocus<CR>

" ------ PLUGS ------
call plug#begin('~/.config/nvim/plugins')

Plug 'arcticicestudio/nord-vim'
Plug 'frazrepo/vim-rainbow'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'

call plug#end()

" ----- CMD CALLS -----
colorscheme nord
let g:rainbow_active = 1
let g:gitgutter_terminal_reports_focus=0
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:lightline = {
	\ 'colorscheme': 'wombat',
	\ }
set relativenumber
set rnu
