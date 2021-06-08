" vimrc
"
" Have fun!
"

set nocompatible
filetype off

source ~/.config/nvim/bundles.vim
source ~/.config/nvim/settings.vim
source ~/.config/nvim/os.vim
source ~/.config/nvim/autocommands.vim
source ~/.config/nvim/completions.vim




for f in split(glob('~/.config/nvim/settings/*.vim'), '\n')
    exe 'source' f
endfor

for f in split(glob('~/.config/nvim/filetypes/*.vim'), '\n')
    exe 'source' f
endfor

for f in split(glob('~/.config/nvim/local/*.vim'), '\n')
  exe 'source' f
endfor

source ~/.config/nvim/mappings.vim
