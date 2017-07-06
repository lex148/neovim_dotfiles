
" Vim Plug  =======================================================================
set nocompatible
filetype off


source ~/.vim/bundle/vim-plug/plug.vim


call plug#begin('~/.vim/bundle')

Plug 'ervandew/supertab'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'cakebaker/scss-syntax.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-git'
Plug 'tpope/vim-markdown'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'kana/vim-textobj-user'
Plug 'vim-scripts/Gundo'
Plug 'scrooloose/syntastic'
Plug 'moll/vim-node'
Plug 'godlygeek/tabular'
Plug 'vim-scripts/SuperTab'
Plug 'benekastah/neomake'
Plug 'dag/vim-fish'
Plug 'leafgarland/typescript-vim'
Plug 'blerins/flattown'
Plug 'mhartington/oceanic-next'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'sheerun/vim-polyglot'
Plug 'othree/yajs.vim'
Plug 'othree/html5.vim'
Plug 'keith/swift.vim'
Plug 'bling/vim-airline'
"Plug 'dodie/vim-disapprove-deep-indentation'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } 
Plug 'junegunn/fzf.vim'

Plug 'junegunn/limelight.vim'



if (executable('ag'))
  Plug 'rking/ag.vim'
endif


call plug#end()

