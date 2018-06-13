set nocompatible
filetype off

nnoremap <space> <nop>
let mapleader = "\<space>"

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ervandew/supertab'
Plugin 'sbdchd/neoformat'
Plugin 'scrooloose/nerdtree'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
call vundle#end()

filetype plugin indent on

au FileType c,cpp setlocal comments-=:// comments+=f://

set t_Co=256
colorscheme solarized8_dark
nnoremap  <leader>B :<c-u>exe "colors" (g:colors_name =~# "dark"
    \ ? substitute(g:colors_name, 'dark', 'light', '')
    \ : substitute(g:colors_name, 'light', 'dark', '')
    \ )<cr>

let g:airline_theme = 'solarized'
let g:airline_powerline_fonts = 1
let g:airline_section_z = '%p%% : %l/%L : %c'
let g:airline#extensions#tabline#enabled = 1

syntax enable

nnoremap <leader>f :Neoformat<cr>

set autoread
set updatetime=100
set number
set hidden
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set listchars=tab:>·
set colorcolumn=80

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

nnoremap <leader>k :NERDTreeToggle<cr>
nnoremap <leader>l :bn<cr>
nnoremap <leader>h :bp<cr>
nnoremap <leader>D :bp\|bd #<cr>
nnoremap <c-j> o<esc>k
nnoremap <c-k> O<esc>j

let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI=1
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.swp$', '\.git$']

highlight ExtraWhitespace ctermbg=red guibg=red
autocmd Syntax * syn match ExtraWhitespace /\s\+\%#\@<!$/

let g:neoformat_javascript_prettier = {
    \ 'exe': 'prettier',
    \ 'args': ['--stdin', '--single-quote'],
    \ 'stdin': 1
    \ }

let g:neoformat_enabled_javascript = ['prettier']
