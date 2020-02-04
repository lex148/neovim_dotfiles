
" Vim Plug  =======================================================================
set nocompatible
filetype off

"source ~/.vim/bundle/vim-plug/plug.vim


call plug#begin('~/.vim/bundle')


"Better Default / Fixes
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-repeat'


"Colors
Plug 'bling/vim-airline'
"Plug 'itchyny/lightline.vim'
Plug 'blerins/flattown'
Plug 'larsbs/vimterial_dark'
Plug 'mhartington/oceanic-next'
Plug 'challenger-deep-theme/vim'
Plug 'fenetikm/falcon'
Plug 'dracula/vim', { 'as': 'dracula' }


"Language Syntax Support
Plug 'cakebaker/scss-syntax.vim'
Plug 'sheerun/vim-polyglot'
Plug 'othree/yajs.vim'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-git'
Plug 'tpope/vim-markdown'
Plug 'vim-ruby/vim-ruby'
Plug 'dag/vim-fish'
Plug 'othree/html5.vim'
Plug 'keith/swift.vim'
Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'


"Tools
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'w0rp/ale' 
"Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree'
"Plug 'tpope/vim-rake'
"Plug 'tpope/vim-surround'
"
"Plug 'scrooloose/syntastic'
"Plug 'vim-scripts/SuperTab'
"Plug 'tpope/vim-rails'
"Plug 'nelstrom/vim-textobj-rubyblock'
"Plug 'kana/vim-textobj-user'
"Plug 'vim-scripts/Gundo'
"Plug 'terryma/vim-multiple-cursors'

"Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
"Plug 'roxma/nvim-completion-manager'
"Plug 'vim-scripts/SuperTab'


Plug 'godlygeek/tabular'
Plug 'moll/vim-node'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } 
Plug 'junegunn/fzf.vim'

Plug 'tmux-plugins/vim-tmux-focus-events'


if (executable('ag'))
  Plug 'rking/ag.vim'
endif


call plug#end()

