vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.HINT] = "",
			[vim.diagnostic.severity.INFO] = "",
			[vim.diagnostic.severity.WARN] = "",
		},
	},
	severity_sort = true,
})


-- Function to show diagnostics on cursor hold
local function lsp_hover_diagnostics()
	local opts = {
		focusable = false,
		close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
		border = "rounded",
		source = "always",
		prefix = " ",
		scope = "cursor",
	}
	vim.diagnostic.open_float(nil, opts)
end


-- Set up autocmd for showing diagnostics on CursorHold
vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
		lsp_hover_diagnostics()
	end,
})

-- set how long it task before CursorHold fires
vim.opt.updatetime = 300
