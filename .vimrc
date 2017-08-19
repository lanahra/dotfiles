set nocompatible
filetype off

nnoremap <space> <nop>
let mapleader = "\<space>"

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'bling/vim-bufferline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ervandew/supertab'
Plugin 'sbdchd/neoformat'
call vundle#end()
filetype plugin indent on

set t_Co=256
colorscheme solarized8_dark
nnoremap  <leader>B :<c-u>exe "colors" (g:colors_name =~# "dark"
    \ ? substitute(g:colors_name, 'dark', 'light', '')
    \ : substitute(g:colors_name, 'light', 'dark', '')
    \ )<cr>

let g:airline_theme='solarized'
let g:bufferline_echo=0

syntax enable

nnoremap <leader>f :Neoformat<cr>

set number
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set listchars=tab:>·
set colorcolumn=80

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

nnoremap <leader>k :NERDTreeToggle<cr>
nnoremap <leader><right> :bn<cr>
nnoremap <leader><left> :bp<cr>

let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI=1
let NERDTreeShowHidden=1

let g:airline_powerline_fonts = 1

highlight ExtraWhitespace ctermbg=red guibg=red
autocmd Syntax * syn match ExtraWhitespace /\s\+\%#\@<!$/

let g:neoformat_javascript_prettier = {
    \ 'exe': 'prettier',
    \ 'args': ['--stdin', '--single-quote'],
    \ 'stdin': 1
    \ }

let g:neoformat_enabled_javascript = ['prettier']
