set splitright
set spell
set autoread
set hidden
set cursorline
set relativenumber
set number
set numberwidth=4
set shell=bash

set title
set ignorecase
set smartcase
set confirm
set termguicolors
set undofile
syntax enable
set clipboard=unnamedplus

"" White characters =============================================================
set tags=tags
set nowrap
set tabstop=2
set softtabstop=2
set expandtab
set list
set listchars=tab:▸\ ,trail:·
set colorcolumn=+1

"Fix file open menu
set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc
set wildmenu
set wildmode=list:longest,full

"Backup / Reloading / Redraw
set backup
set backupdir=~/.local/share/nvim/backup//
set updatetime=300 " Reduce time for highlighting other references
set redrawtime=10000 " Allow more time for loading syntax on large files



