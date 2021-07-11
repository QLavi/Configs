" LAVENROSE VIM CONFIGURATION

" ------ KEYBINDS ------
noremap K {
noremap J }

nnoremap <SPACE>n :NERDTreeToggle<CR>
nnoremap <C-Space> i<c-x><c-n>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <leader>[ :vs<CR>
nnoremap <leader>] :sp<CR>
nnoremap <leader>c <C-w>c

nnoremap cl :noh<CR>

nnoremap tn :tabnew<CR>
nnoremap tc :tabc<CR>

nnoremap ss :w<CR>
nnoremap ty :terminal<CR>
nnoremap yt <C-\><C-n>

" ------ PLUGS ------
call plug#begin('~/.config/nvim/plugins')

Plug 'morhetz/gruvbox'
Plug 'nvim-treesitter/nvim-treesitter'
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
set nocompatible
syntax on

set clipboard +=unnamed,unnamedplus
set noshowmode

set splitbelow
set splitright
set relativenumber number

set t_Co=256
set t_ut=

" configure treesitter
lua << EOF
require'nvim-treesitter.configs'.setup {
	ensure_installed = {"c"},
	highlight = {
	enable = true,
	disable = {},
	},
}
EOF

syntax on
colorscheme gruvbox

if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif

let g:lightline = {
	\ 'colorscheme': 'seoul256',
	\ }
set tabstop=4
set shiftwidth=0

" set listchars=space:.,tab:>- list

