" Turn on completion for php
setlocal omnifunc=phpcomplete#CompletePHP

" Run Exuberant Ctags everytime I save a php file
autocmd BufWritePost php silent! !ctags -R &

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

" Syntastic
let g:syntastic_php_phpcs_args = '--standard=PSR1'
