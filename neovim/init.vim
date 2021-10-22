nnoremap ss :w<cr>
nnoremap cl :noh<cr>

let mapleader = ' '
nnoremap <leader>v :vs<cr>
nnoremap <leader>s :sp<cr>

nnoremap <leader>wh <C-w>h
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>wl <C-w>l

nnoremap <leader>d <C-w>l
nnoremap <leader>a <C-w>h
nnoremap <leader>wc <C-w>c

nnoremap <leader>ec :e [Fill This]<cr>

call plug#begin("[Fill This]")

Plug 'morhetz/gruvbox'
Plug 'tomasiser/vim-code-dark'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'nvim-treesitter/nvim-treesitter'

call plug#end()

syntax on
set nocompatible
set noshowmode

set splitright splitbelow

lua << EOF
require"nvim-treesitter.configs".setup
{
ensure_installed = {"c", "python", "cpp"},
highlight = {enable=true, disable={}}
}
EOF

let g:gruvbox_bold = 0
colorscheme gruvbox

let g:lightline = {'colorscheme': 'seoul256'}

set clipboard +=unnamed,unnamedplus
set tabstop=4
set shiftwidth=4
set expandtab
set mouse=a

au BufReadPost *.vert,*.frag,*.comp set filetype=c
