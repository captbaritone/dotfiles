Test TODO state changes

Setup tests:

    :so test_setup.vim

Regular expression to match a timestamp:
    :let g:ts_re='\d\{4\}-\d\{2\}-\d\{2\} \d\{2\}:\d\{2\}:\d\{2\}'

Insert a sample entry

    > TODO 2009-09-06 Test entry
    :let g:entry = '2009-09-06 Test entry'

Single state change:

    @k
    @\cs
    DONE ${g:entry}
    ^    CLOSED: ${g:ts_re} re
        :LOGBOOK:
    ^        DONE: ${g:ts_re} re

More state changes

    @\cs
    CANCELLED ${g:entry}
    ^    CLOSED: ${g:ts_re} re
        :LOGBOOK:
    ^        CANCELLED: ${g:ts_re} re
    ^        DONE: ${g:ts_re} re

    @\cs
    TODO ${g:entry}
        :LOGBOOK:
    ^        TODO: ${g:ts_re} re
    ^        CANCELLED: ${g:ts_re} re
    ^        DONE: ${g:ts_re} re

vim: ft=vimcram
