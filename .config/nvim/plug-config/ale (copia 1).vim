let g:ale_sign_error = 'x'
let g:ale_sign_warning = '⚠'
let g:ale_fix_on_save = 1

highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

let g:ale_fixers = {
	  \ 'javascript': ['eslint'],
	  \}

