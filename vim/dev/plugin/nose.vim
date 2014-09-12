" Run 
let s:testProjectRoot = '~/projects/HearsayLabs/fanmgmt'
let s:testSettings = 'settings.jeldredge'
let s:testCommand = './run.sh manage.py test --settings=' . s:testSettings
let s:testScript = 'clear && cd ' . s:testProjectRoot . " && " . s:testCommand

let s:lastCmd = ''

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
    if(s:lastCmd == '')
        echo "ERROR: No last test to run, try running a test first"
    else
        call s:runCommand(s:lastCmd)
    endif
endfunction

" Private functions

function! s:fileName()
    return expand('%:p')
endfunction

function! s:runCommand(cmd)
    compile nose
    let s:lastCmd = a:cmd
    let &makeprg=a:cmd
    echo "Running: " a:cmd
    Make
endfunction


