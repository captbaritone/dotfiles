" ----------------------------------------------------------------------------
"   Plug
" ----------------------------------------------------------------------------

" Install vim-plug if we don't already have it
if empty(glob("~/.vim/autoload/plug.vim"))
    " Ensure all needed directories exist  (Thanks @kapadiamush)
    execute 'mkdir -p ~/.vim/plugged'
    execute 'mkdir -p ~/.vim/autoload'
    " Download the actual plugin manager
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

" Colorschemes
Plug 'captbaritone/molokai'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'altercation/vim-colors-solarized'
Plug 'fxn/vim-monochrome'
Plug 'chriskempson/base16-vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'ajh17/spacegray.vim'

" Syntax
Plug 'tpope/vim-git', { 'for': 'git' }
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
Plug 'qrps/lilypond-vim', { 'for': 'lilypond' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'mxw/vim-jsx'

" Completion
Plug 'mattn/emmet-vim', { 'for': 'html' }

" Make % match xml tags
Plug 'edsono/vim-matchit', { 'for': ['html', 'xml'] }

" Make tab handle all completions
Plug 'ervandew/supertab'

" Syntastic: Code linting errors
Plug 'scrooloose/syntastic', { 'for': ['php', 'python', 'javascript', 'css'] }

" Pairs of handy bracket mappings
Plug 'tpope/vim-unimpaired'

" Fancy statusline
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Fuzzy file opener
" Plug 'kien/ctrlp.vim' <-- Not maintained any more
Plug 'ctrlpvim/ctrlp.vim'

" Open from quick-fix-list in new split
Plug 'yssl/QFEnter'

Plug 'editorconfig/editorconfig-vim'

Plug 'rking/ag.vim'
Plug 'Chun-Yang/vim-action-ag'

" Rename files from within vim
Plug 'tpope/vim-eunuch'

" Make commenting easier
Plug 'tpope/vim-commentary'

Plug 'scrooloose/nerdtree'
" Adjust 'shiftwidth' and 'expandtab' heuristically based on the current file
"Plug 'tpope/vim-sleuth'

" CamelCase motions through words
Plug 'bkad/CamelCaseMotion'

" Split and join lines of code intelligently
Plug 'AndrewRadev/splitjoin.vim'

Plug 'gcmt/taboo.vim'

Plug 'vim-scripts/CursorLineCurrentWindow'

" Split navigation that works with tmux
Plug 'christoomey/vim-tmux-navigator'

" Change brackets and quotes
Plug 'tpope/vim-surround'
" Make vim-surround repeatable with .
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'

" Custom motions

" Indent object
Plug 'michaeljsmith/vim-indent-object'
" Camel Case object
Plug 'bkad/CamelCaseMotion'
"
" Argument object
Plug 'vim-scripts/argtextobj.vim'

" Fugitive: Git from within Vim
Plug 'tpope/vim-fugitive'
"Plug 'airblade/vim-gitgutter'

" Run Python tests in tmux splits
" Plug 'captbaritone/projects/vim-vigilant', { 'for': 'python' }
Plug '~/projects/vim-vigilant', { 'for': 'python' }
Plug 'benmills/vimux', { 'for': ['python', 'javascript'] }

"Plug 'Valloric/YouCompleteMe'
" Python completion and tag navigation
Plug 'davidhalter/jedi-vim', { 'for': 'python' }

Plug 'FooSoft/vim-argwrap'

" Take notes and keep todo lists in vim
Plug 'vimwiki/vimwiki'

" Find the class/method based on cursor position
"Plug 'vim-scripts/pythonhelper'

" 'Vastly improved Javascript indentation and syntax support in Vim'
Plug 'pangloss/vim-javascript'

Plug 'reedes/vim-pencil'

" Visualize undo tree
Plug 'mbbill/undotree'

Plug 'parkr/vim-jekyll'


" Other plugins require curl
if executable("curl")

    " Webapi: Dependency of Gist-vim
    Plug 'mattn/webapi-vim'

    " Gist: Post text to gist.github
    Plug 'mattn/gist-vim'
endif

filetype plugin indent on                   " required!
call plug#end()
