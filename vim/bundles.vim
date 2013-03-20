" ----------------------------------------------------------------------------
"   Vundle
" ----------------------------------------------------------------------------


set nocompatible                          " Leave Vi in the dust

filetype off                              " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle (required)
Bundle 'gmarik/vundle'                    

                                          " Molokai colorscheme
Bundle 'tomasr/molokai'                   
                                          " My personal Todo list syntax
Bundle 'captbaritone/myTodo'              
                                          " MiniBufExpl: Show open buffers
"Bundle 'fholgado/minibufexpl.vim'         
                                          " Syntastic: Highlight code errors
Bundle 'scrooloose/syntastic'             
                                          " Solarized: Colorscheme
Bundle 'altercation/vim-colors-solarized' 
                                          " Powerline: Pretty statusline
Bundle 'Lokaltog/vim-powerline'           
                                          " Vim-Git: Highlight git files
Bundle 'tpope/vim-git'
                                          " Zen Coding: Quickly write html
"Bundle 'mattn/zencoding-vim'
                                          " Scss Syntax
Bundle 'cakebaker/scss-syntax.vim'
                                          " Fugitive: Git from within Vim
"Bundle 'tpope/vim-fugitive'
                                          " Window manager for vim splits
Bundle 'captbaritone/dwm.vim'
                                          " Syntax and scripts for Lilypond
Bundle 'qrps/lilypond-vim'
                                          " Indexed Search: Shows # of matches
Bundle 'vim-scripts/IndexedSearch'
                                          " Allow % to go to matching XML tags
Bundle 'tsaleh/vim-matchit'
                                          " Change brackets and quotes
Bundle 'tpope/vim-surround'
                                          " Command-T alternative in Vimscript
Bundle 'kien/ctrlp.vim.git'
                                          " GitGutter adds +/- to lines re git
Bundle 'airblade/vim-gitgutter'
                                          " Rename files from within vim
Bundle 'danro/rename.vim'
                                          " Allow per-project .vimrc files
Bundle 'embear/vim-localvimrc'
                                          " Automatically align var blocks
Bundle 'godlygeek/tabular'

" Needs compilation, so we haven't set it up yet. Still it looks worth
" exploring. Now I learn it needs a newer version of vim... :(
" Requires a newer version of vim then I have
" Bundle 'Valloric/YouCompleteMe'

Bundle 'skammer/vim-css-color'
if has('python')                          " Some plugins require python
                                          " Gundo: Undo history
    Bundle 'sjl/gundo.vim'
                                          " Ultisnips: Snippet manager
    Bundle 'SirVer/ultisnips'
endif

if has('ruby')
                                          " File launcher
    "Bundle 'wincent/Command-T'
endif

if executable("curl")                     " Other plugins require curl
                                          " Webapi: Dependency of Gist-vim
    Bundle 'mattn/webapi-vim'                 
                                          " Gist: Post text to gist.github
    Bundle 'mattn/gist-vim'                   
endif

" Some plugins that I don't use, but are worth keeping track of
                                          " Slow down vim, so you are forced to
                                          " make more efficient choices
" Bundle 'artemave/slowdown.vim'

  
filetype plugin indent on                 " required!

" Needed on jailed servers
set shell=/bin/bash                       " Allows Vundle to work on jailed servers
