require("core.options")
require("core.keymaps")
require("core.lazy")


require("lsp")

--require("plugins-setup")
--require("core.keymaps")
--require("plugins.gruvbox")


vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
