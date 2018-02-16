" Required for operations modifying multiple buffers like rename.
set hidden


"" Automatically start language servers.
"let g:LanguageClient_autoStart = 1
"
"" Minimal LSP configuration for JavaScript
"let g:LanguageClient_serverCommands = {}
"if executable('javascript-typescript-stdio')
"  let g:LanguageClient_serverCommands.javascript = ['javascript-typescript-stdio']
"  " Use LanguageServer for omnifunc completion
"  autocmd FileType javascript setlocal omnifunc=LanguageClient#complete
"else
"  echo "javascript-typescript-stdio not installed!\n"
"  :cq
"endif

" \ 'rust': ['rustup', 'run', 'nightly', 'rls'],

let g:LanguageClient_serverCommands = {
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['javascript-typescript-stdio'],
    \ 'typescript': ['javascript-typescript-stdio'],
    \ }

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
