return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	opts = {
		formatters = {
			rubocop_bundled = {
				command = "bundle",
				args = { "exec", "rubocop", "-a", "--stderr", "--stdin", "$FILENAME" },
				stdin = true,
			},
			htmlbeautifier_bundled = {
				command = "bundle",
				args = { "exec", "htmlbeautifier", "-b1" },
				stdin = true,
			},
		},
		formatters_by_ft = {
			ruby = { "rubocop_bundled" },
			eruby = { "htmlbeautifier_bundled" },
		},
		format_on_save = {
			timeout_ms = 5000, -- rubocop can be slow
			lsp_fallback = false,
		},
	},
}
