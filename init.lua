require("core.options")
require("core.keymaps")
require("core.lazy")


vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
