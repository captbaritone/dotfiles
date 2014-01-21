" ----------------------------------------------------------------------------
"   Vundle
" ----------------------------------------------------------------------------


set nocompatible                            " Leave Vi in the dust

filetype off                                " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle (required)
Bundle 'gmarik/vundle'

" Colorschemes
Bundle 'tomasr/molokai'
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'altercation/vim-colors-solarized'

" Syntax
Bundle 'tpope/vim-git'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'xsbeats/vim-blade'
Bundle 'qrps/lilypond-vim'
Bundle 'tpope/vim-ragtag'

" Completion
Bundle 'shawncplus/phpcomplete.vim'

" Make tab handle all completions
Bundle 'ervandew/supertab'

" Syntastic: Code linting errors
Bundle 'scrooloose/syntastic'

" Fancy statusline
Bundle 'bling/vim-airline'

" Fuzzy file opener
Bundle 'kien/ctrlp.vim.git'

" Rename files from within vim
Bundle 'AlexJF/rename.vim'

" Allow for HTML indenting in .php
Bundle 'captbaritone/better-indent-support-for-php-with-html'

" Change brackets and quotes
Bundle 'tpope/vim-surround'

" Fugitive: Git from within Vim
Bundle 'tpope/vim-fugitive'

" Some plugins require python
if has('python')

    " Gundo: Undo history
    Bundle 'sjl/gundo.vim'
    " Ultisnips: Snippet manager
    Bundle 'SirVer/ultisnips'
endif

" Other plugins require curl
if executable("curl")

    " Webapi: Dependency of Gist-vim
    Bundle 'mattn/webapi-vim'

    " Gist: Post text to gist.github
    Bundle 'mattn/gist-vim'
endif

filetype plugin indent on                   " required!

" Needed on jailed servers
set shell=/bin/bash                         " Allows Vundle to work on jailed servers
