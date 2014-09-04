" ----------------------------------------------------------------------------
"   Plug
" ----------------------------------------------------------------------------

" Load vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

" Colorschemes
Plug 'tomasr/molokai'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'altercation/vim-colors-solarized'
Plug 'fxn/vim-monochrome'

" Syntax
Plug 'tpope/vim-git', { 'for': 'git' }
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
Plug 'xsbeats/vim-blade', { 'for': 'blade' }
Plug 'qrps/lilypond-vim', { 'for': 'lilypond' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

" Completion
Plug 'mattn/emmet-vim'

" Make % match xml tags
Plug 'edsono/vim-matchit'

" Make tab handle all completions
Plug 'ervandew/supertab'

" Syntastic: Code linting errors
Plug 'scrooloose/syntastic', { 'for': ['php', 'python', 'javascript', 'css'] }

" Fancy statusline
Plug 'bling/vim-airline'

" Fuzzy file opener
Plug 'kien/ctrlp.vim'

" Rename files from within vim
Plug 'AlexJF/rename.vim'

Plug 'gcmt/taboo.vim'

" Split navigation that works with tmux
Plug 'christoomey/vim-tmux-navigator'

" Change brackets and quotes
Plug 'tpope/vim-surround'
" Make vim-surround repeatable with .
Plug 'tpope/vim-repeat'

" Fugitive: Git from within Vim
Plug 'tpope/vim-fugitive'

" Python test running
Plug 'benmills/vimux'
Plug 'pitluga/vimux-nose-test', { 'for': 'python' }
Plug '~/.vim/dev', { 'for': 'python' }

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
