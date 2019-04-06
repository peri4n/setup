let g:ale_linters = {
    \   'haskell': ['hie', 'hlint', 'hdevtools', 'hfmt', 'hindent'],
    \}

let g:ale_haskell_hie_executable = 'hie-wrapper'

let g:ale_fixers = {'haskell': ['hlint', 'stylish-haskell']}

nnoremap <silent> [m :ALEPrevious<cr>
nnoremap <silent> ]m :ALENext<cr>

