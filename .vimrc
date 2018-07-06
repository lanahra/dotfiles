" Colorscheme
syntax enable

set t_Co=256
colorscheme solarized8_dark


" Tab width
set autoindent
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4


" UI
filetype indent on
filetype plugin on
set autoread
set colorcolumn=80
set cursorline
set hidden
set lazyredraw
set list
set listchars=tab:>>
set mouse=a
set number
set showcmd
set showmatch
set updatetime=100
set wildmenu


" Search
set ignorecase
set incsearch
set hlsearch


" Leader
nnoremap <space> <nop>
let mapleader = "\<space>"

nnoremap <leader>f :Neoformat<cr>
vnoremap <leader>f :Neoformat! &filetype<cr>
nnoremap <leader>t :NERDTreeToggle<cr>
nnoremap <leader>h :bp<cr>
nnoremap <leader>l :bn<cr>
nnoremap <leader>D :bp\|bd #<cr>
nnoremap <leader>B :<c-u>exe "colors" (g:colors_name =~# "dark"
    \ ? substitute(g:colors_name, 'dark', 'light', '')
    \ : substitute(g:colors_name, 'light', 'dark', '')
    \ )<cr>


" Shortcuts
nnoremap j gj
nnoremap k gk
nnoremap gV `[v`]
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l


" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd Syntax * syn match ExtraWhitespace /\s\+\%#\@<!$/


" AutoGroup
augroup configgroup
    autocmd!
    autocmd BufEnter *.java setlocal colorcolumn=100
augroup END


" Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'ap/vim-css-color'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ervandew/supertab'
Plugin 'sbdchd/neoformat'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-commentary'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
call vundle#end()


" Airline
let g:airline_theme = 'solarized'
let g:airline_powerline_fonts = 1
let g:airline_section_z = '%p%% : %l/%L : %c'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'


" gitgutter
let g:gitgutter_map_keys = 0


" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI=1
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.swp$', '\.git$']


" Neoformat
let g:neoformat_java_google = {
    \ 'exe': 'java',
    \ 'args': ['-jar', '~/.jars/google-java-format.jar', '--aosp', '-'],
    \ 'stdin': 1
    \ }

let g:neoformat_javascript_prettier = {
    \ 'exe': 'prettier',
    \ 'args': ['--stdin', '--single-quote'],
    \ 'stdin': 1
    \ }

let g:neoformat_enabled_java = ['google']
let g:neoformat_enabled_javascript = ['prettier']

" Syntastic
let g:syntastic_mode_map = { 'passive_filetypes': ['java'] }
