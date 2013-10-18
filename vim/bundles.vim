" ----------------------------------------------------------------------------
"   Vundle
" ----------------------------------------------------------------------------


set nocompatible                            " Leave Vi in the dust

filetype off                                " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle (required)
Bundle 'gmarik/vundle'

                                            " Colorschmes
Bundle 'tomasr/molokai'
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'altercation/vim-colors-solarized'
                                            " My personal Todo list syntax
Bundle 'captbaritone/myTodo'
                                            " Syntastic: Highlight code errors
Bundle 'scrooloose/syntastic'
                                            " Allow for HTML indenting in .php
Bundle 'captbaritone/better-indent-support-for-php-with-html'
                                            " Powerline: Pretty statusline
"Bundle 'Lokaltog/vim-powerline'
Bundle 'bling/vim-airline'
                                            " Vim-Git: Highlight git files
Bundle 'tpope/vim-git'
                                            " Zen Coding: Quickly write html
Bundle 'mattn/emmet-vim'
                                            " Scss Syntax
Bundle 'cakebaker/scss-syntax.vim'
                                            " Window manager for vim splits
Bundle 'captbaritone/dwm.vim'
                                            " Syntax and scripts for Lilypond
Bundle 'qrps/lilypond-vim'
                                            " Indexed Search: Shows # of matches
Bundle 'vim-scripts/IndexedSearch'
                                            " Allow % to go to matching XML tags
                                            " Replaced by xmledit
"Bundle 'tsaleh/vim-matchit'
                                            " Change brackets and quotes
Bundle 'tpope/vim-surround'
                                            " Autoclose ({" etc.
Bundle 'Townk/vim-autoclose'
Bundle 'sukima/xmledit'
                                            " Command-T alternative in Vimscript
Bundle 'kien/ctrlp.vim.git'
                                            " GitGutter adds +/- to lines re git
Bundle 'airblade/vim-gitgutter'
                                            " Possibly a faster than Gitgutter
"Bundle 'mhinz/vim-signify'
" Still too slow :(
                                            " Per repository .vimrcs
"Bundle 'captbaritone/repo-vimrc'
                                            " Rename files from within vim
Bundle 'danro/rename.vim'
                                            " Automatically align var blocks
Bundle 'godlygeek/tabular'

if has('python')                            " Some plugins require python
                                            " Gundo: Undo history
    Bundle 'sjl/gundo.vim'
                                            " Ultisnips: Snippet manager
    Bundle 'SirVer/ultisnips'
endif

if has('ruby')
                                            " File launcher
    "Bundle 'wincent/Command-T'
endif

if executable("curl")                       " Other plugins require curl
                                            " Webapi: Dependency of Gist-vim
    Bundle 'mattn/webapi-vim'
                                            " Gist: Post text to gist.github
    Bundle 'mattn/gist-vim'
endif

                                            " Fugitive: Git from within Vim
Bundle 'tpope/vim-fugitive'

filetype plugin indent on                   " required!

" Needed on jailed servers
set shell=/bin/bash                         " Allows Vundle to work on jailed servers
