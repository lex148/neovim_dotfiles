vim.lsp.config("lua_ls", {
	cmd = { 'lua-language-server' },
	filetypes = { 'lua' },
	root_markers = {
		'.git'
	}
})

vim.lsp.config("cssls", {
	-- vscode-css-language-server --stdio
	cmd = { 'vscode-css-language-server', '--stdio' },
	filetypes = { 'css', 'scss', 'less' },
	root_markers = {
		'.git'
	}
})

vim.lsp.enable("lua_ls")
vim.lsp.enable("cssls")
