" ----------------------------------------------------------------------------
"   Vundle
" ----------------------------------------------------------------------------

" Colorschemes
Plug 'tomasr/molokai'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'altercation/vim-colors-solarized'
Plug 'fxn/vim-monochrome'

" Syntax
Plug 'tpope/vim-git'
Plug 'cakebaker/scss-syntax.vim'
Plug 'xsbeats/vim-blade'
Plug 'qrps/lilypond-vim'
Plug 'tpope/vim-ragtag'
Plug 'plasticboy/vim-markdown'

" Completion
Plug 'mattn/emmet-vim'

" Make % match xml tags
Plug 'edsono/vim-matchit'

" Make tab handle all completions
Plug 'ervandew/supertab'

" Syntastic: Code linting errors
Plug 'scrooloose/syntastic'

" Fancy statusline
Plug 'bling/vim-airline'

" Fuzzy file opener
Plug 'kien/ctrlp.vim'

" Rename files from within vim
Plug 'AlexJF/rename.vim'

Plug 'gcmt/taboo.vim'

" Split navigation
Plug 'christoomey/vim-tmux-navigator'

" Change brackets and quotes
Plug 'tpope/vim-surround'
" Make vim-surround repeatable with .
Plug 'tpope/vim-repeat'

" Fugitive: Git from within Vim
Plug 'tpope/vim-fugitive'

" Python test running
Plug 'JarrodCTaylor/vim-python-test-runner'

" Some plugins require python
if has('python')

    " Gundo: Undo history
    Plug 'sjl/gundo.vim'
    " Ultisnips: Snippet manager
    Plug 'SirVer/ultisnips'
endif

" Other plugins require curl
if executable("curl")

    " Webapi: Dependency of Gist-vim
    Plug 'mattn/webapi-vim'

    " Gist: Post text to gist.github
    Plug 'mattn/gist-vim'
endif

filetype plugin indent on                   " required!
call plug#end()

" Needed on jailed servers
set shell=/bin/bash                         " Allows Vundle to work on jailed servers
