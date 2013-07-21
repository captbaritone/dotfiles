" ----------------------------------------------------------------------------
"   .vimrc                                                                {{{
" ----------------------------------------------------------------------------

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
set spell                       " Turn on spelling
set spelllang=en_us             " Set the spelling language 
                                " Set my personal spelling file
set spellfile=$HOME/.vim/spell/en.utf-8.add
set nohidden                    " Don't allow buffers to exist in the background
set ttyfast                     " Indicates a fast terminal connection
set backspace=indent,eol,start  " Allow backspaceing over autoindent, line breaks, starts of insert
set shortmess+=I                " No welcome screen
set history=200                 " Remember the last 200 :ex commands
set iskeyword-=_                " Underscore is a word boundary

" }}}-------------------------------------------------------------------------
"   Visual                                                                {{{
" ----------------------------------------------------------------------------

" Control Area (May be superseded by vim-airline)
set showcmd                 " Show (partial) command in the last line of the screen.
set wildmenu                " Command completion
set wildmode=list:longest   " List all matches and complete till longest common string
set laststatus=2            " The last window will have a status line always
set noshowmode              " Don't show the mode in the last line of the screen, vim-airline takes care of it
set ruler                   " Show the line and column number of the cursor position, separated by a comma.
set lazyredraw

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

" Windows
set winminheight=0
set winheight=999 " Fill whole height

" show fold column, fold by markers
set foldcolumn=0            " Don't show the folding gutter/column
set foldmethod=marker       " Fold on {{{ }}}

" Prettier folding
" From: http://dhruvasagar.com/2013/03/28/vim-better-foldtext
function! NeatFoldText() "{{{
  let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
  let foldchar = split(filter(split(&fillchars, ','), 'v:val =~# "fold"')[0], ':')[-1]
  let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
  let foldtextend = lines_count_text . repeat(foldchar, 8)
  let length = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g'))
  return foldtextstart . repeat(foldchar, winwidth(0)-length) . foldtextend
endfunction

set foldtext=NeatFoldText()
" }}}
" Highlight tabs and trailing spaces
set listchars=tab:▸\ ,trail:•,eol:¬
set list

" Trim trailing white space on save (preserving cursor position)
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

"autocmd FileType c,cpp,java,php,ruby,python,js autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" Character meaning when present in 'formatoptions'
" ------ ---------------------------------------
" c Auto-wrap comments using textwidth, inserting the current comment leader automatically.
" q Allow formatting of comments with "gq".
" r Automatically insert the current comment leader after hitting <Enter> in Insert mode.
" t Auto-wrap text using textwidth (does not apply to comments)
" n Recognize numbered lists
" 1 Don't break line after one-letter words
set formatoptions=cqrn1

syntax enable               " This has to come after colorcolumn in order to draw it.
set t_Co=256                " enable 256 colors

" Colorscheme (Don't complain if you don't have it yet)
let g:molokai_original = 0
silent! colorscheme molokai

" Printing options
set printoptions=header:0,duplex:long,paper:letter,syntax:n
" header:0                  Do not print a header
" duplex:long (default)     Print on both sides (when possible), bind on long
" syntax:n                  Do not use syntax highlighting.  This is faster and

" }}}-------------------------------------------------------------------------
"   GUI Specific                                                          {{{
" ----------------------------------------------------------------------------

" Consider moving these .gvim
if has("gui_running")
    " Hide Scrollbars
	set guioptions-=T       " Remove tool bar
	set guioptions-=r       " Remove right-hand scroll bar
    set guioptions-=m       " Remove menu bar
    set guioptions-=L       " Remove left-hand scroll bar 
    set background=dark

    if has("gui_gtk2")
        " Set the font for Linux machines
        set guifont=Inconsolata\ 9
    elseif has("gui_win32")
        " set guifont=Consolas:h11:cANSI
    else
        " set guifont=Menlo
        let g:airline_powerline_fonts=1
        set guifont=Inconsolata\ for\ Powerline:h13
    endif
else
    " Don't show the airline separators if we are not in GUI
    " The angle bracket defaults look fugly
    let g:airline_left_sep=''
    let g:airline_right_sep=''
endif

" }}}-------------------------------------------------------------------------
"   Search                                                                {{{
" ----------------------------------------------------------------------------

" Turned this off because it broke greedy search and replace
set incsearch               " Show search results as we type
set showmatch               " Show matching brackets
set hlsearch                " Highlight search results

" Use regex for searches
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v
set ignorecase              " Ignore case when searching
set smartcase               " Don't ignore case if we have a capital letter

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
set smarttab                " Smart indent on new line, works for C-like langs.
set shiftround              " Round indent to multiple of 'shiftwidth'.

" }}}-------------------------------------------------------------------------
"   Custom commands                                                       {{{
" ----------------------------------------------------------------------------

" automatically reload vimrc when it's saved
" Turned off because it would end up loading plugins multiple times
" au BufWritePost *vimrc so $MYVIMRC

" Edit the vimrc file
nmap <silent> ,ev :e $MYVIMRC<CR>
nmap <silent> ,eb :e $HOME/.vim/bundles.vim<CR>
nmap <silent> ,sv :so $MYVIMRC<CR>
nmap <silent> ,sb :so $HOME/.vim/bundles.vim<CR>

" }}}-------------------------------------------------------------------------
"   Plugins                                                               {{{
" ----------------------------------------------------------------------------

" Set Ultisnip directory
let g:UltiSnipsSnippetDirectories=["snippets"]
" Cycle through ultisnip triggers with <tab>
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Return to last edit position when opening files, except git commit message
autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

" Gist Vim
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" Ctrl-P
let g:ctrlp_root_markers = 'info.*'     " Projects in ~/Work have info.md files
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/]\.(git|hg|svn|sass-cache)$',
	\ 'file': '\v\.(png|jpg|jpeg|gif|DS_Store)$',
	\ 'link': '',
	\ }
let g:ctrlp_show_hidden = 1
let g:ctrlp_clear_cache_on_exit = 0

" Whenever a new file is opened, foucs that pane
autocmd BufRead,BufNewFile * call DWM_Focus()

let g:airline_enable_fugitive=1
let g:airline_enable_syntastic=1
"let g:airline_theme='dark'
let g:airline_theme='solarized'


" }}}-------------------------------------------------------------------------
"   Custom filetypes                                                      {{{
" ----------------------------------------------------------------------------

" Auto detect filetype
autocmd BufRead,BufNewFile *.md,*.markdown  set filetype=markdown
autocmd BufRead,BufNewFile *.php            set filetype=phtml
autocmd BufRead,BufNewFile ~/dotfiles/ssh/config set filetype=sshconfig
" Override what is done in /vim/bundle/scss-syntax.vim/ftdetect/scss.vim
" This should prevent duplicate snippets
autocmd BufRead,BufNewFile *.scss	        set filetype=scss

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
autocmd FileType html        set local ts=4 sts=4 sw=4 expandtab
autocmd FileType css         set local ts=4 sts=4 sw=4 expandtab
autocmd FileType scss        set local ts=4 sts=4 sw=4 expandtab
autocmd FileType javascript  set local ts=4 sts=4 sw=4 expandtab
autocmd FileType config      set local ts=2 sts=2 sw=2 expandtab
autocmd FileType gitconfig   set local ts=4 sts=4 sw=4 noexpandtab
autocmd FileType ruby,eruby  set local ts=2 sts=2 sw=2 expandtab

" Run Exuberant Ctags everytime I save a php file
au BufWritePost php silent! !ctags -R &

" }}}-------------------------------------------------------------------------
"   Custom mappings                                                       {{{
" ----------------------------------------------------------------------------


" When pasting, refill the default register with what you just pasted
xnoremap p pgvy

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

" To encourage the use of <C-[np]> instead of the arrow keys in ex mode, remap
" them to use <Up/Down> instead so that they will filter completions
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

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

