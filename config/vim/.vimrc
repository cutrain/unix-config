set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'scrooloose/nerdtree'
Plugin 'Yggdroot/indentLine'
Plugin 'tell-k/vim-autopep8'
Plugin 'scrooloose/nerdcommenter'
Plugin 'davidhalter/jedi-vim'
Plugin 'mattn/emmet-vim'
Plugin 'docunext/closetag.vim'
Plugin 'cutrain/vim-gitgutter'
" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)


" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on    " required

set ruler
set number
set st=4
set ts=4
set sw=4
au BufNewFile,BufRead *py,*.html,*.css,*.js
			\ set expandtab
au BufNewFile,BufRead *.html,*.css,*.js
			\ set sw=2
			\ ts=2
			\ st=2
set autoindent
set smartindent
set smarttab
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

"GitGutter
"git diff with a specific version
"let g:gitgutter_diff_base = '<commit SHA>'

