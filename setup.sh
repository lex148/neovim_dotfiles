#!/bin/bash

mkdir -p ~/.vim/tmp/backup
mkdir -p ~/.vim/tmp/swap
mkdir -p ~/.vim/tmp/undo

mkdir -p ~/.vim/bundle

cd ~/.vim/bundle

if [ -d "~/.vim/bundle/vim-plug" ]; then
  echo "vim-plug aleady downloaded"
else
  echo "Downloading vim-plug"
  git clone https://github.com/junegunn/vim-plug.git 
fi

cd ~/.vim/bundle/vim-plug
git pull origin master

#nvim +PlugInstall! +qa!

#cd ~/.vim/bundle/YouCompleteMe/
#./install.sh
