" Run 
let s:testScript = 'clear && cd ~/projects/HearsayLabs/fanmgmt && ./run.sh manage.py test --settings=settings.jeldredge'

nnoremap <leader>nc :call RunCurrentTests()<cr>
nnoremap <leader>nn :RunLastTests<cr>

command! RunLastTests :call s:RunLastTests()

function! RunTests()
    s:runCmd(s:testScript)
endfunction

function! RunCurrentTests()
    let s:cmd = s:testScript . ' ' .  s:fileName()
    call s:runCommand(s:cmd)
endfunction

function! RunFocusedTests()
    let line_number = getline('.')
    let s:cmd = s:testScript . ' ' . s:fileName() . " --line " . line_number
    call s:runCommand(s:cmd)
endfunction

function! s:RunLastTests()
    call VimuxRunLastCommand()
endfunction

" Private functions

function! s:fileName()
    return expand('%:p')
endfunction

function! s:runCommand(cmd)
    echo a:cmd
    call VimuxRunCommand(a:cmd)
endfunction


