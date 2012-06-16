" ----------------------------------------------------------------------------
"   .vimrc
" ----------------------------------------------------------------------------
" TODO: See what happens when the swap/undo/backup files are not in place

" Pathogen
call pathogen#infect()

" Base Options
set nocompatible
let mapleader = ","
set encoding=utf-8
set hidden " Allow buffers to exist in the background
set ttyfast " Indicates a fast terminal connection
set backspace=indent,eol,start " Allow backspaceing over autoindent, line breaks, starts of insert
set shortmess+=I

" ----------------------------------------------------------------------------
"   Interface
" ----------------------------------------------------------------------------

" Control Area (May be superseeded by PowerLine)
set showcmd
set wildmenu " Command completion
set wildmode=list:longest " When more than one match, list all matches and complete till longest common string
set laststatus=2 " The last window will have a status line always
set showmode
"let g:Powerline_symbols = 'fancy'

" Buffer Area Visuals
set scrolloff=3 " Minimal number of screen lines to keep above and below the cursor.
set visualbell
set cursorline
set ruler " Show the line and column number of the cursor position, separated by a comma.
set number
set wrap
set linebreak " Break the line on words
set textwidth=79
if exists('+colorcolumn')
  set colorcolumn=+1
endif
set formatoptions=cqrn1
" letter meaning when present in 'formatoptions'
" ------ ---------------------------------------
" c Auto-wrap comments using textwidth, inserting
" the current comment leader automatically.
" q Allow formatting of comments with "gq".
" r Automatically insert the current comment leader
" after hitting <Enter> in Insert mode. 
" t Auto-wrap text using textwidth (does not apply
" to comments)
syntax enable " This has to come after colorcolumn in order to draw it.
set t_Co=256 " enable 256 colors

" Search
set gdefault " Greedy search by default
set incsearch
set showmatch
set hlsearch
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v
set ignorecase    " ignore case when searching
    " Clear search highlights
nnoremap <leader><space> :noh<cr>

" Disable arrow keys to keep from falling back on bad habbits 
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
" Navigate using displayed lines not actual lines
nnoremap j gj
nnoremap k gk


" ----------------------------------------------------------------------------
"   Formatting
" ----------------------------------------------------------------------------
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent " Copy indent from current line when starting new line
set smartindent " Smart indent on new line, works for C-like langs.
set shiftround " Round indent to multiple of 'shiftwidth'.


" ----------------------------------------------------------------------------
"   Custom Comands
" ----------------------------------------------------------------------------

" automatically reload vimrc when it's saved
au BufWritePost *vimrc so $MYVIMRC

" Custom command to refresh Chrome on save
command! W exec "w" | silent !osascript ~/.vim/scripts/refresh_chrome.scptd

" Map :NERDTree to nt
nmap nt :NERDTree <CR>

" Enable NERDCommenter
filetype plugin on

" Code hilighing extentions
autocmd BufRead *.md        set filetype=markdown
autocmd BufRead *.markdown  set filetype=markdown
filetype plugin on

" Templates
"au BufNewFile *.html 0r ~/.vim/templates/html.txt


" ----------------------------------------------------------------------------
"   GUI Specific 
" ----------------------------------------------------------------------------
if has("gui_running")
    " Hide Scrollbars
	set guioptions-=T " Remove toolbar
	set guioptions-=r " Remove right-hand scroll bar
    set guioptions-=m " Remove menu bar
    set guioptions-=L " Remove left-hand scroll bar 
    set background=dark
    colorscheme molokai
endif

" ----------------------------------------------------------------------------
"   Undo, Backup and Swap file locations
" ----------------------------------------------------------------------------

set directory=$HOME/.vim/swapdir//
set backupdir=$HOME/.vim/backupdir//
if exists('+undodir') 
    set undodir=$HOME/.vim/undodir
    set undofile
endif
    
