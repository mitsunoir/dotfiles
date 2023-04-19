" ALE configuration
let g:ale_python_mypy_executable = './.venv/bin/mypy'
let g:ale_python_pylint_executable = './.venv/bin/pylint'
let g:ale_python_black_executable = './.venv/bin/black'
let g:ale_python_isort_executable = './.venv/bin/isort'

let g:ale_linters = {
\   'python': ['mypy', 'pylint'],
\}

let g:ale_fixers = {
\   'python': ['black', 'isort'],
\}

let g:ale_fix_on_save = 1
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 1

" Set some nice ALE signs
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'

" Enable ALE signs
let g:ale_sign_column_always = 1

" Customize ALE gutter
highlight ALEErrorSign guifg=#F44747 ctermfg=196
highlight ALEWarningSign guifg=#FFCC00 ctermfg=214
highlight ALEInfoSign guifg=#6796E6 ctermfg=68

