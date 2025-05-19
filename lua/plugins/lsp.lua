return {

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"folke/lazydev.nvim",
			ft = "lua",
			opts = {
				library = {
					{ path = "${3rd/luv/library}", words = {"vim%.uv"} }
				},
			},
		},
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			require("lspconfig").lua_ls.setup({ capabilities = capabilities })
			require("lspconfig").tailwindcss.setup({ capabilities = capabilities })
			require("lspconfig").ts_ls.setup({ capabilities = capabilities })
		end,
	},

	{
		'mrcjkb/rustaceanvim',
		version = '^6',
		lazy = false,
	},


	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
	},

}
