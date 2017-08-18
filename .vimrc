set nocompatible
filetype off

nnoremap <space> <nop>
let mapleader = "\<space>"

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'sbdchd/neoformat'
call vundle#end()
filetype plugin indent on

set t_Co=256
colorscheme solarized8_dark
nnoremap  <leader>B :<c-u>exe "colors" (g:colors_name =~# "dark"
    \ ? substitute(g:colors_name, 'dark', 'light', '')
    \ : substitute(g:colors_name, 'light', 'dark', '')
    \ )<cr>

syntax enable

nnoremap <leader>f :Neoformat<cr>

set number
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set listchars=tab:>·
set colorcolumn=80

let g:nerdtree_tabs_open_on_console_startup=1
let NERDTreeShowHidden=1

highlight ExtraWhitespace ctermbg=red guibg=red
autocmd Syntax * syn match ExtraWhitespace /\s\+\%#\@<!$/

let g:neoformat_javascript_prettier = {
    \ 'exe': 'prettier',
    \ 'args': ['--stdin', '--single-quote'],
    \ 'stdin': 1
    \ }

let g:neoformat_enabled_javascript = ['prettier']
