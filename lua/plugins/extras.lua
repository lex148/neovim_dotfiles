return {


	{
		'saecki/crates.nvim',
		tag = 'stable',
		config = function()
			require('crates').setup({})
		end,
	},

	{ 'akinsho/git-conflict.nvim', version = "*", config = true }


}
