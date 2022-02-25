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

nnoremap <leader>ec :e ~/.vimrc<cr>

call plug#begin("~/.config/nvim/plugins")

Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

call plug#end()

syntax on
set nocompatible
set noshowmode
set number relativenumber

set splitright splitbelow
set termguicolors

let g:gruvbox_bold = 0
colorscheme gruvbox

let g:lightline = {'colorscheme': 'seoul256'}

set clipboard +=unnamed,unnamedplus
set tabstop=2
set shiftwidth=2
set expandtab
set mouse=a

au BufReadPost *.vert,*.frag,*.comp set filetype=c
