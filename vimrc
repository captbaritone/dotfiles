" Pathogen
call pathogen#infect()

" TABS
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" FROM 'COMING HOME TO VIM'
let mapleader = ","
set nocompatible
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set gdefault
set incsearch
set showmatch
" Perlesque search
nnoremap / /\v
vnoremap / /\vset hlsearch
set ignorecase    " ignore case when searching
nnoremap <leader><space> :noh<cr>
set shortmess+=I

set number
set wrap
set linebreak
set textwidth=79
set formatoptions=qrn1
" automatically reload vimrc when it's saved
au BufWritePost *vimrc so ~/.vimrc

" CAN I HACK IT WITHOUT ARROW KEY
" nnoremap <up> <nop>
" nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk
command! W exec "w" | silent !osascript ~/.vim/scripts/refresh_chrome.scptd

" Code hilighing extentions
au BufNewFile,BufRead *.md set filetype=markdown
filetype plugin on

colorscheme molokai

" MACVIM SETTINGS
if has("gui_running")
    " Hide Scrollbars
	set guioptions-=T
	set guioptions-=r
    set guioptions-=L 
    " This function does not work on my command line version
    set colorcolumn=85
    
    " Save undo files in my home .vim dir
    set undodir=~/.vim/undodir
    set undofile
endif

" Set the swap dir locally for security reasons
set directory=~/.vim/swapdir//
set backupdir=~/.vim/backupdir//
