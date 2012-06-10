Test TODO entry creation macros

Setup tests:

    :so test_setup.vim
    :let g:today = strftime("%Y-%m-%d")

TODO entry creation with cn abbreviation

    > cn Test Entry
    TODO ${g:today} Test Entry

TODO entry creation with \cn macro (note the trailing space)

    @\cn
    (3) TODO ${g:today} 

vim: ft=vimcram
