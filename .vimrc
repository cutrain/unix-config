set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Bundle 'gmarik/Vundle.vim'
Bundle 'vim-scripts/indentpython.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/nerdtree'
Bundle 'Yggdroot/indentLine'
Bundle 'tell-k/vim-autopep8'
Bundle 'scrooloose/nerdcommenter'
Bundle 'davidhalter/jedi-vim'
Plugin 'mattn/emmet-vim'
Bundle 'docunext/closetag.vim'
Bundle 'Valloric/YouCompleteMe'
" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)


" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on    " required

set ruler
set number
set st=4
set ts=4
set sw=4
au BufNewFile,BufRead *py
			\ set expandtab
set autoindent
set smartindent
set cindent
set fileformat=unix

color slate
set t_Co=256

set encoding=utf-8
syntax on

set showmatch
set mouse=a
set hlsearch
set incsearch
set cursorline
highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.c,*.cpp,*.h match BadWhitespace /\s\+$/
set nocompatible
set backspace=indent,eol,start

"set completeopt=menu
"autocmd FileType python set omnifunc=python3complete#Complete
"set completeopt -=preview
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
set completeopt=longest,menu
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_enable_diagnostic_highlighting = 0
"let g:ycm_auto_trigger=0
inoremap <unique> <C-_> <C-X><C-O><C-P>

"NERDTree
map <F2> :NERDTreeToggle<CR>
let NERDTreeChDirMode=1
"显示书签"
let NERDTreeShowBookmarks=1
"设置忽略文件类型"
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swap$']
"窗口大小"
let NERDTreeWinSize=25

"autoline  autopip8
let g:indentLine_char='┆'
let g:indentLine_enabled = 1

let g:autopep8_disable_show_diff=1

"auto-pairs nerdcommenter
map <F4> <leader>ci <CR>
