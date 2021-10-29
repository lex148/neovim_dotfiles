" General Mappings =============================================================
com! W :w
com! WQ :wq
com! Q :q
com! Wall :wall

map <leader>d !!date<CR> " Insert Date
map <leader>i :set list!<CR> " Toggle invisible chars

" map <leader>f :FZF<CR>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


" use :w!! to write to a file using sudo if you forgot to 'sudo vim file'
" (it will prompt for sudo password when writing)
cmap w!! %!sudo tee > /dev/null %

" Easy Buffer Navigation =======================================================
noremap <C-h>  <C-w>h
noremap <C-j>  <C-w>j
noremap <C-k>  <C-w>k
noremap <C-l>  <C-w>l


" Shortcut to config files =====================================================
nnoremap <leader>ev <C-w>s<C-w>j:e $MYVIMRC<cr>

" HACK: fix del key in st
map <F1> <del>
map! <F1> <del>

