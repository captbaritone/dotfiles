" Syntastic

" Don't user pylint even though it's installed
let g:syntastic_python_checkers = ['python', 'pyflakes', 'pep8', 'pylint']
let g:syntastic_python_pep8_args="--ignore=E501,E121,E125,E126,E128,C0111"

