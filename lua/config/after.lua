--vim.cmd [[colorscheme tokyonight-storm]]
vim.cmd("let g:gruvbox_material_background = 'soft'")
vim.cmd [[colorscheme gruvbox-material]]


-- format the buffer on save with the LSP if it supports it
vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if not client then return end

		---@diagnostic disable-next-line: missing-parameter
		if client.supports_method('textDocument/formatting') then
			vim.api.nvim_create_autocmd('BufWritePre', {
				buffer = args.buf,
				callback = function()
					vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
				end
			})
		end
	end,
})
