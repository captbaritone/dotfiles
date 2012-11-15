" ----------------------------------------------------------------------------
"   Vundle
" ----------------------------------------------------------------------------

" Some known (noticed) bugs:
"   1. When the last buffer has syntax highlighting, :bd removes the 
"   highlighting instead of closing the buffer
"
"   2. Syntastic does not work on my php installation on my mac. I think it has
"   to do with errors being returned in a different format from the php command
"   line tool.
"
"   3. If I open a new file from outside of vim and then try to focus it with
"   dwm, often it focuses the wrong file.
"
"   4. Dwm and minibufexpl do not play well together. Minibufexpl would need
"   special treatment.
"
"


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
Bundle 'mattn/zencoding-vim'
                                          " Scss Syntax
Bundle 'cakebaker/scss-syntax.vim'
                                          " Fugitive: Git from within Vim
Bundle 'tpope/vim-fugitive'
                                          " Window manager for vim splits
Bundle 'spolu/dwm.vim'
                                          " Syntax and scripts for Lilypond
Bundle 'qrps/lilypond-vim'
                                          " Indexed Search: Shows the number of
                                          " matches when you search
Bundle 'vim-scripts/IndexedSearch'                                        
                                          
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

  
filetype plugin indent on                 " required!

" Needed on jailed servers
set shell=/bin/bash                       " Allows Vundle to work on jailed servers
