" ----------------------------------------------------------------------------
"   .vimrc                                                                {{{
" ----------------------------------------------------------------------------
" TODO: See what happens when the swap/undo/backup files are not in place


" }}}-------------------------------------------------------------------------
"   Vundle                                                                {{{
" ----------------------------------------------------------------------------

" Include bundles in a separate file to avoid Chicken and Egg issue
" http://gmarik.info/blog/2011/05/17/chicken-or-egg-dilemma
source ~/.vim/bundles.vim

" }}}-------------------------------------------------------------------------
"   Base Options                                                          {{{
" ----------------------------------------------------------------------------

" Set the leader key to , instead of \ because it's easier to reach
let mapleader = ","
"set notimeout                  " Turn off the timeout for the leader key
                                " Seems to break `n` in normal mode, so
                                " I turned it off
set encoding=utf-8              " I generally want utf-8 encoding
set spell                       " Trun on spelling
set spelllang=en_us             " Set the spelling language 
                                " Set the spelling file
set spellfile=$HOME/.vim/spell/en.utf-8.add
set hidden                      " Allow buffers to exist in the background
set ttyfast                     " Indicates a fast terminal connection
set backspace=indent,eol,start  " Allow backspaceing over autoindent, line breaks, starts of insert
set shortmess+=I                " No welcome screen

" }}}-------------------------------------------------------------------------
"   Visual                                                                {{{
" ----------------------------------------------------------------------------

" Control Area (May be superseeded by PowerLine)
set showcmd                 " Show (partial) command in the last line of the screen.
set wildmenu                " Command completion
set wildmode=list:longest   " List all matches and complete till longest common string
set laststatus=2            " The last window will have a status line always
set showmode                " Show the mode in the last line of the screen
set ruler                   " Show the line and column number of the cursor position, separated by a comma.

" Buffer Area Visuals
set scrolloff=7             " Minimal number of screen lines to keep above and below the cursor.
set visualbell              " Use a visual bell
set cursorline              " Highlight the current line
set number                  " Show line numbers
set wrap                    " Soft wrap at the window width
set linebreak               " Break the line on words
set textwidth=79            " Break lines at just under 80 characters
if exists('+colorcolumn')
  set colorcolumn=+1        " Highlight the column after `textwidth` 
endif

" show fold column, fold by markers
set foldcolumn=0            " Don't show the folding gutter/column
set foldmethod=marker       " Fold on {{{ }}}

" Highlight tabs and trailing spaces
set listchars=tab:▸\ ,trail:•,eol:¬
set list

" Trim trailing white space on save (preserving cursor postion
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType c,cpp,java,php,ruby,python,css autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" letter meaning when present in 'formatoptions'
" ------ ---------------------------------------
" c Auto-wrap comments using textwidth, inserting
" the current comment leader automatically.
" q Allow formatting of comments with "gq".
" r Automatically insert the current comment leader
" after hitting <Enter> in Insert mode. 
" t Auto-wrap text using textwidth (does not apply
" to comments)
set formatoptions=cqrn1

syntax enable               " This has to come after colorcolumn in order to draw it.
set t_Co=256                " enable 256 colors

" Colorscheme (Don't complain if you don't have it yet)
silent! colorscheme molokai

" Printing options
set printoptions=header:0,duplex:long,paper:letter,syntax:n
" header:0                  Do not print a header
" duplex:long (default)	    Print on both sides (when possible), bind on long
" syntax:n		            Do not use syntax highlighting.  This is faster and


" }}}-------------------------------------------------------------------------
"   GUI Specific                                                          {{{
" ----------------------------------------------------------------------------

if has("gui_running")
    " Hide Scrollbars
	set guioptions-=T       " Remove tool bar
	set guioptions-=r       " Remove right-hand scroll bar
    set guioptions-=m       " Remove menu bar
    set guioptions-=L       " Remove left-hand scroll bar 
    set background=dark

    if has("gui_running")
        if has("gui_gtk2")
            " Set the font for linux machines
            set guifont=Inconsolata\ 9
        elseif has("gui_win32")
            " set guifont=Consolas:h11:cANSI
        endif
    endif
endif

" }}}-------------------------------------------------------------------------
"   Search                                                                {{{
" ----------------------------------------------------------------------------

" Turned this off because it broke greedy search and replace
"set gdefault                " Greedy search by default
set incsearch               " Show search results as we type
set showmatch               " Show matching brackets
set hlsearch                " Highlight search results

" Use regex for searches
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v
set ignorecase              " Ignore case when searching

" Clear search highlights
nnoremap <leader><space> :nohlsearch<cr>

" }}}-------------------------------------------------------------------------
"   Tabs                                                                  {{{
" ----------------------------------------------------------------------------

set tabstop=4               " Show a tab as four spaces
set shiftwidth=4            " Reindent is also four spaces
set softtabstop=4           " When hit <tab> use four columns
set expandtab               " Create spaces when I type <tab>
set autoindent              " Copy indent from current line when starting new line
set smartindent             " Smart indent on new line, works for C-like langs.
set shiftround              " Round indent to multiple of 'shiftwidth'.

" }}}-------------------------------------------------------------------------
"   Custom commands                                                       {{{
" ----------------------------------------------------------------------------

" automatically reload vimrc when it's saved
" Turned off because it would end up loading plugins multiple times
" au BufWritePost *vimrc so $MYVIMRC

" Show the highlighting group that the cursor position belongs to
" Stolen from: https://github.com/derekwyatt/vim-config/blob/master/vimrc
nmap <silent> ,h :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Edit the vimrc file
nmap <silent> ,ev :e $MYVIMRC<CR>
nmap <silent> ,eb :e $HOME/.vim/bundles.vim<CR>
nmap <silent> ,sv :so $MYVIMRC<CR>
nmap <silent> ,sb :so $HOME/.vim/bundles.vim<CR>

" Underline the current line with '='
nmap <silent> ,u= :t.\|s/./=/g\|:nohls<cr>
nmap <silent> ,u- :t.\|s/./-/g\|:nohls<cr>

" Trying this alternative to escape
imap jk <esc>
cmap jk <esc>
imap kj <esc>
cmap kj <esc>
imap jj <esc>
cmap jj <esc>

" }}}-------------------------------------------------------------------------
"   Plugins                                                               {{{
" ----------------------------------------------------------------------------

" Custom command to refresh Chrome on save
" Replaced by LiveReload
" command! W exec "w" | silent !osascript ~/.vim/scripts/refresh_chrome.scptd

" Set Ultisnip directory
let g:UltiSnipsSnippetDirectories=["snippets"]
" Cycle through ultisnip triggers with <tab>
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Return to last edit position when opening files
" XXX This could be improved to ignore gitcommit file type
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Gist Vim
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" Ctrl-P
let g:ctrlp_root_markers = 'info.*'     " Projects in ~/Work have info.md files
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/]\.(git|hg|svn)$',
	\ 'file': '\v\.(png|jpg|gif)$',
	\ 'link': '',
	\ }

" Whenever a new file is opened, foucs that pane
autocmd BufRead,BufNewFile * call DWM_Focus()

" Turn on Git gutters by default
let g:gitgutter_enabled = 1

" }}}-------------------------------------------------------------------------
"   Custom filetypes                                                      {{{
" ----------------------------------------------------------------------------

" Auto detect filetype
autocmd BufRead,BufNewFile *.md,*.markdown  set filetype=markdown
autocmd BufRead,BufNewFile ~/dotfiles/ssh/config set filetype=sshconfig


"php syntax options 
let php_sql_query = 1                   "for SQL syntax highlighting inside strings
let php_htmlInStrings = 1               "for HTML syntax highlighting inside strings
"php_baselib = 1                        "for highlighting baselib functions
"php_asp_tags = 1                       "for highlighting ASP-style short tags
"php_parent_error_close = 1             "for highlighting parent error ] or )
"php_parent_error_open = 1              "for skipping an php end tag, if there exists an open ( or [ without a closing one
"php_oldStyle = 1                       "for using old colorstyle
"php_noShortTags = 1                    "don't sync <? ?> as php
let php_folding = 1                     "for folding classes and functions

" Sass and Css options
autocmd BufRead,BufNewFile *.css,*.scss,*.less setlocal foldmethod=marker foldmarker={,}

" Per file-type indention rules
autocmd FileType html setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType css setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType scss setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType javascript setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType config setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType gitconfig setlocal ts=4 sts=4 sw=4 noexpandtab


" }}}-------------------------------------------------------------------------
"   Custom mappings                                                       {{{
" ----------------------------------------------------------------------------

" When pasting, refill the default register with what you just pasted
xnoremap p pgvy

" Note: the next command destroys the visual mode <C-v> hotkey
" nnoremap <C-v> "+pa

" gundo plugin. Requires vim being compiled with Python support
nnoremap <F5> :GundoToggle<CR>

" Disable arrow keys to keep from falling back on bad habits 
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Navigate using displayed lines not actual lines
nnoremap j gj
nnoremap k gk

" Reselect visual block after indent/outdent: http://vimbits.com/bits/20
vnoremap < <gv
vnoremap > >gv

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! %!sudo tee > /dev/null %

" Do what my fat fingers mean!
cmap Bd bd
cmap BD bd
cmap Q q
cmap W w

" }}}-------------------------------------------------------------------------
"   Undo, Backup and Swap file locations                                  {{{
" ----------------------------------------------------------------------------

set directory=$HOME/.vim/swapdir//
set backupdir=$HOME/.vim/backupdir//
if exists('+undodir') 
    set undodir=$HOME/.vim/undodir
    set undofile
endif

" }}}-------------------------------------------------------------------------
"   If there is a local .vimrc, source it here at the end                 {{{
" ----------------------------------------------------------------------------

if filereadable(glob("$HOME/.vimrc.local")) 
    source $HOME/.vimrc.local
endif

" }}}-------------------------------------------------------------------------
"                                                                         {{{
" ----------------------------------------------------------------------------

