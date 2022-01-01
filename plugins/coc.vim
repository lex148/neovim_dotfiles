

"NOTE: You might need to run
"cd $HOME/.local/share/nvim/site/plugins/coc.nvim/
"yarn install
"yarn build

Plug 'neoclide/coc.nvim', {'branch': 'release'}

 let g:coc_global_extensions = [
     \ 'coc-css',
     \ 'coc-rust-analyzer',
     \ 'coc-eslint',
     \ 'coc-html',
     \ 'coc-json',
     \ 'coc-sh',
     \ 'coc-tsserver',
     \ 'coc-pairs',
     \ 'coc-sql',
     \ 'coc-svg',
 \ ]
     ""\ 'coc-git',
     ""\ 'coc-snippets',

set encoding=utf-8
set cmdheight=2
set signcolumn=number

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')