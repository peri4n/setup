let g:ale_linters = {
    \   'haskell': ['hie', 'hlint', 'hdevtools', 'hfmt', 'hindent'],
    \}

let b:ale_fixers = {'haskell': ['hlint', 'stylish-haskell']}

nnoremap <silent> [m :ALEPrevious<cr>
nnoremap <silent> ]m :ALENext<cr>

