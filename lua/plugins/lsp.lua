return {

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"folke/lazydev.nvim",
			ft = "lua",
			opts = {
				library = {
					{ path = "${3rd/luv/library}", words = { "vim%.uv" } }
				},
			},
		},
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			vim.lsp.config('lua_ls', { capabilities = capabilities })
			vim.lsp.config('tailwindcss', { capabilities = capabilities })
			vim.lsp.config('ts_ls', { capabilities = capabilities })
			vim.lsp.config('cssls', { capabilities = capabilities })

			-- note: rust is loaded with rustaceanvim
		end,
	},

	{
		'mrcjkb/rustaceanvim',
		version = '^6',
		lazy = false,
	},



}
