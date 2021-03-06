
"let g:ale_linters = {'rust': ['rustfmt']}
let g:ale_linters = {'rust': ['cargo', 'rustc', 'rls', 'rustfmt']}


"let g:ale_rust_cargo_include_features = 'clippy'
let g:ale_rust_cargo_use_clippy = executable('cargo-clippy')
"let g:ale_rust_cargo_use_clippy = executable('cargo-clippy')

let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\}

let g:ale_fix_on_save = 1
