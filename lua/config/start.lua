vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

vim.o.relativenumber = true
vim.o.undodir = vim.fn.stdpath("config") .. "/undo"
vim.o.backupdir = vim.fn.stdpath("config") .. "/backup"
vim.o.directory = vim.fn.stdpath("config") .. "/swap"
vim.o.undolevels = 1000
vim.o.undoreload = 10000
vim.o.backupcopy = "yes"
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.formatprg = "par  -w80"
vim.o.termguicolors = true

-- vim.opt.wrapscan = false
vim.opt.wrap = false

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.spell = true
vim.o.autoread = true
vim.o.signcolumn = "yes"

-- All new windows should get focus
vim.api.nvim_create_augroup("AutoJumpToSplit", { clear = true })
vim.api.nvim_create_autocmd("WinNew", {
	group = "AutoJumpToSplit",
	callback = function()
		vim.cmd('wincmd w')
	end,
})
