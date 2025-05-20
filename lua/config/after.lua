vim.cmd [[colorscheme tokyonight-storm]]
--vim.cmd("let g:gruvbox_material_background = 'soft'")
--vim.cmd [[colorscheme gruvbox-material]]



-- call format whenever the file saves
vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		local mode = vim.api.nvim_get_mode().mode
		local filetype = vim.bo.filetype
		if vim.bo.modified == true and mode == 'n' and filetype ~= "oil" then
			vim.cmd('lua vim.lsp.buf.format()')
		else
		end
	end
})
