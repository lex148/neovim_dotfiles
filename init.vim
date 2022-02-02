
"  General settings
source $HOME/.config/nvim/general.vim

" Key Mappings
source $HOME/.config/nvim/keymaps.vim

"--------------------------------------------------------------------------
" Plugins
"--------------------------------------------------------------------------

" Automatically install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(data_dir . '/plugins')


  " COLOR SCHEMAS / APPEARANCE
  source $HOME/.config/nvim/plugins/vim-sensible.vim
  source $HOME/.config/nvim/plugins/vim-repeat.vim
  "source $HOME/.config/nvim/plugins/dracula.vim
  source $HOME/.config/nvim/plugins/gruvbox.vim
  source $HOME/.config/nvim/plugins/vim-airline.vim
 
  " General Behaver
  source $HOME/.config/nvim/plugins/ripgrep.vim
  source $HOME/.config/nvim/plugins/fzf.vim
  "source $HOME/.config/nvim/plugins/dispatch.vim
  source $HOME/.config/nvim/plugins/vim-test.vim
  source $HOME/.config/nvim/plugins/heritage.vim
  source $HOME/.config/nvim/plugins/lastplace.vim
  source $HOME/.config/nvim/plugins/nerdtree.vim
  source $HOME/.config/nvim/plugins/editorconfig.vim
  source $HOME/.config/nvim/plugins/vimtex.vim
  source $HOME/.config/nvim/plugins/nvim-comment.vim
  "source $HOME/.config/nvim/plugins/treesitter.vim
  "source $HOME/.config/nvim/plugins/vim-visual-multi.vim
 
  " Language Syntax
  source $HOME/.config/nvim/plugins/polyglot.vim
  source $HOME/.config/nvim/plugins/yats.vim
  source $HOME/.config/nvim/plugins/rainbow.vim

  " Language Server
  source $HOME/.config/nvim/plugins/coc.vim
  source $HOME/.config/nvim/plugins/cocfzf.vim

  "SQL
  source $HOME/.config/nvim/plugins/dadbod.vim


call plug#end()
doautocmd User PlugLoaded

