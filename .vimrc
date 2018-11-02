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

nnoremap <leader>q :source ~/.vimrc<cr>
nnoremap <leader>f :Neoformat<cr>
xnoremap <leader>f :Neoformat! &filetype<cr>
nnoremap <leader>t :NERDTreeToggle<cr>
nnoremap <leader>T :NERDTreeFind<cr>
nnoremap <leader>b :TagbarToggle<cr>
nnoremap <leader>/ :CtrlPTag<cr>
nnoremap <leader>h :bp<cr>
nnoremap <leader>l :bn<cr>
nnoremap <leader>D :bp\|bd #<cr>
nnoremap <leader>B :<c-u>exe "colors" (g:colors_name =~# "dark"
    \ ? substitute(g:colors_name, 'dark', 'light', '')
    \ : substitute(g:colors_name, 'light', 'dark', '')
    \ )<cr>
nnoremap <leader>ca :call CscopeFindInteractive(expand('<cword>'))<cr>
nnoremap <leader>ct :call ToggleLocationList()<cr>
nnoremap <leader>cc :call CscopeFind('c', expand('<cword>'))<cr>


" Shortcuts
nnoremap <esc> :noh<cr><esc>
nnoremap <C-c> "+yy
xnoremap <C-c> "+y
nnoremap <C-x> "+dd
xnoremap <C-x> "+d
nnoremap <C-v> "+p
inoremap <C-v> <esc>"+pa
xnoremap <C-v> d<esc>"+P
nnoremap j gj
nnoremap k gk
nnoremap gV `[v`]
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l


" AutoGroup
augroup configgroup
    autocmd!
    autocmd BufEnter *.java setlocal colorcolumn=100
    autocmd BufEnter *.pug setlocal filetype=pug
    autocmd BufEnter *.ts,*.tsx setlocal filetype=typescript
    autocmd BufEnter *.js.snap setlocal filetype=javascript
    autocmd BufEnter *.yaml,*.yml setlocal sw=2 sts=2
    autocmd BufEnter Jenkinsfile setlocal filetype=groovy
augroup END


" Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'ap/vim-css-color'
Plugin 'brookhong/cscope.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'digitaltoad/vim-pug'
Plugin 'ervandew/supertab'
Plugin 'janko-m/vim-test'
Plugin 'leafgarland/typescript-vim'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'majutsushi/tagbar'
Plugin 'sbdchd/neoformat'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-obsession'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
call vundle#end()


" Airline
let g:airline_theme = 'solarized'
let g:airline_powerline_fonts = 1
let g:airline_section_z = '%p%% : %l/%L : %c'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'


" CtrlP
let g:ctrlp_max_files = 0


" cscope
let g:cscope_silent = 1


" gitgutter
let g:gitgutter_map_keys = 0


" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

autocmd FileType nerdtree noremap <buffer> <leader>h <nop>
autocmd FileType nerdtree noremap <buffer> <leader>l <nop>
autocmd FileType nerdtree noremap <buffer> <leader>D <nop>

let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI=1
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.swp$', '\.git$', 'Session.vim$', 'tags$']

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "~",
    \ "Staged"    : "+",
    \ "Untracked" : "?",
    \ "Renamed"   : ">",
    \ "Unmerged"  : "=",
    \ "Deleted"   : "-",
    \ "Dirty"     : "~",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "."
    \ }


" Neoformat
let g:neoformat_c_clang = {
    \ 'exe': 'clang-format',
    \ 'args': ['-style=~/.clang-format'],
    \ 'stdin': 1
    \ }

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

let g:neoformat_typescript_prettier = {
    \ 'exe': 'prettier',
    \ 'args': ['--stdin', '--single-quote', '--parser', 'typescript'],
    \ 'stdin': 1
    \ }

let g:neoformat_xml_tidier = {
    \ 'exe': 'tidy',
    \ 'args': ['-quiet',
    \          '-xml',
    \          '--indent auto',
    \          '--indent-spaces ' . shiftwidth(),
    \          '--vertical-space yes',
    \          '--indent-attributes yes',
    \          '--tidy-mark no'
    \         ],
    \ 'stdin': 1,
    \ }

let g:neoformat_enabled_c = ['clangformat']
let g:neoformat_enabled_java = ['google']
let g:neoformat_enabled_javascript = ['prettier']
let g:neoformat_enabled_typescript = ['prettier']
let g:neoformat_enabled_xml = ['tidier']


" Syntastic
let g:syntastic_mode_map = { 'passive_filetypes': ['java'] }


" YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'


"" Vim Test
let test#javascript#jest#options = '--config=jest.config.json'


"" Typescript
let g:typescript_indent_disable = 1
