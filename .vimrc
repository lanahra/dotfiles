set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'terryma/vim-multiple-cursors'

call vundle#end()
filetype plugin indent on

colorscheme Monokai

syntax enable

set number
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set listchars=tab:>·

let g:nerdtree_tabs_open_on_console_startup=1
let NERDTreeShowHidden=1

highlight ExtraWhitespace ctermbg=red guibg=red
autocmd Syntax * syn match ExtraWhitespace /\s\+\%#\@<!$/
