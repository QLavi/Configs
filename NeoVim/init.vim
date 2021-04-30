" LAVENROSE VIM CONFIGURATION

" ------ KEYBINDS ------
noremap u k
noremap k l
noremap l u

nnoremap nn :NERDTreeToggle<CR>
nnoremap <C-Space> i<c-x><c-n>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-u> <C-w>k
nnoremap <C-k> <C-w>l

nnoremap <C-w> :resize +3<CR>
nnoremap <C-s> :resize -3<CR>
nnoremap <C-a> :vertical resize +3<CR>
nnoremap <C-d> :vertical resize -3<CR>

nnoremap <leader>[ :vs<CR>
nnoremap <leader>] :sp<CR>

nnoremap wc <C-w>c
nnoremap cl :noh<CR>

nnoremap tn :tabnew<CR>
nnoremap tc :tabc<CR>

nnoremap ss :w<CR>
nnoremap ty :terminal<CR>
nnoremap yt <C-\><C-n>

" ------ PLUGS ------
call plug#begin('~/.config/nvim/plugins')

Plug 'frazrepo/vim-rainbow'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'bronson/vim-trailing-whitespace'
Plug 'airblade/vim-gitgutter'

call plug#end()

" ----- CMD CALLS -----
set splitbelow
set splitright
let g:rainbow_active = 1
let g:lightline = {
	\ 'colorscheme': 'wombat',
	\ }
set tabstop=4
set shiftwidth=0
set number relativenumber
set rnu

