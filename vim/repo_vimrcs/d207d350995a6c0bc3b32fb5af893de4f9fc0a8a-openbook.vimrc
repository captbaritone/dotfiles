setlocal noexpandtab
autocmd BufReadPost *.mako            set filetype=lilypond
autocmd FileType mako autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
