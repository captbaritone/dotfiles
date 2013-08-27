setlocal noexpandtab
autocmd! BufReadPost *.mako            setlocal filetype=lilypond shiftwidth=4 softtabstop=4
autocmd FileType lilypond autocmd BufWritePre <buffer> :call StripTrailingWhitespaces()
setlocal foldlevelstart=99

function! GetProjectRoot()
    return expand('%:p:h').'/../..'
endfunction

function! GetPdfPath()
    return 'out/src/jazz/' . substitute(expand('%:t'), 'mako', 'pdf', '')
endfunction

function! GetMakeCommand()
    return 'make -C '.GetProjectRoot()." ".GetPdfPath()
endfunction


function! OpenPdf()
    execute '!gnome-open ' . GetPdfPath() . '&'
endfunction

map <buffer> <F5> :w<Return>:let &makeprg=GetMakeCommand()<Return>:make<Return>
map <buffer> <F6> OpenPdf()
let b:did_ftplugin = 1

map <buffer> <F6> :execute OpenPdf()
