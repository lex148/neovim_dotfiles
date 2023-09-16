local opt = vim.opt

opt.splitright = true
opt.spell = true
opt.autoread = true
opt.hidden = true
opt.cursorline = true
opt.relativenumber = true
opt.number = true
opt.numberwidth = 4
opt.shell = "bash"

opt.title = true
opt.ignorecase = true
opt.smartcase = true
opt.confirm = true
opt.termguicolors = true
opt.undofile = true
opt.signcolumn = 'yes'
opt.clipboard:append("unnamedplus") -- use system clipboard as default register
opt.syntax = "enable"

-- White characters =============================================================
opt.tags = "tags"
opt.wrap = false
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

opt.listchars:append({
  trail = '·',
})

opt.listchars.tab = '▸'
--opt.listchars.tab = '▸\ '
opt.list = true



opt.background = 'dark'


--opt.listchars=tab:▸\ ,trail:·
--opt.colorcolumn = opt.colorcolumn + 1

-- "Fix file open menu
opt.wildmenu = true
opt.wildmode = "list:longest,full"
opt.wildignore =
".svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc,*-lock.*,*.lock"
-- set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc
-- set wildmenu
-- set wildmode=list:longest,full

-- "Backup / Reloading / Redraw
-- set backup
-- set backupdir=~/.local/share/nvim/backup//
-- set updatetime=300 " Reduce time for highlighting other references
-- set redrawtime=10000 " Allow more time for loading syntax on large files
