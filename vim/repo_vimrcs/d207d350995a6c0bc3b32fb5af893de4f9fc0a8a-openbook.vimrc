setlocal noexpandtab
autocmd BufRead,BufNewFile *.mako            set filetype=lilypond
autocmd FileType mako autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
