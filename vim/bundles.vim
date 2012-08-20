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
Bundle 'fholgado/minibufexpl.vim'         
                                          " Syntastic: Highlight code errors
Bundle 'scrooloose/syntastic'             
                                          " Solarized: Colorscheme
Bundle 'altercation/vim-colors-solarized' 
                                          " Powerline: Pretty statusline
Bundle 'Lokaltog/vim-powerline'           
                                          " Vim-Git: Hilight git files
Bundle 'tpope/vim-git'
                                          " Fugitive: Git from within Vim
Bundle 'tpope/vim-fugitive'

if has('python')                          " Some plugins require python
                                          " Gundo: Undo history
    Bundle 'sjl/gundo.vim'                    
                                          " Ultisnips: Snippet manager
    Bundle 'SirVer/ultisnips'                 
endif

if executable("curl")                     " Other plugins require curl
                                          " Webapi: Dependancy of Gist-vim
    Bundle 'mattn/webapi-vim'                 
                                          " Gist: Post text to gist.github
    Bundle 'mattn/gist-vim'                   
endif

  
filetype plugin indent on                 " required!

" Not sure if this will be needed on jailed servers
" set shell=/bin/bash                     " Allows pathogen to work on jailed servers
