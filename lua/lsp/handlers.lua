local M = {}


-- TODO: make the hover colorful using the next methods:
-- vim.lsp.util.convert_input_to_markdown_lines()
-- vim.lsp.util.stylize_markdown()
-- vim.lsp.util.try_trim_markdown_code_blocks()
M.setup = function()
  local signs = {
    { name = "DiagnosticSignError", text = " " },
    { name = "DiagnosticSignWarn", text = " " },
    { name = "DiagnosticSignHint", text = " " },
    { name = "DiagnosticSignInfo", text = " " },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  -- local config = {
  --   -- disable virtual text
  --   virtual_text = false,
  --   -- show signs
  --   signs = {
  --     active = signs,
  --   },
  --   update_in_insert = true,
  --   underline = true,
  --   severity_sort = true,
  --   float = {
  --     focusable = false,
  --     style = "minimal",
  --     border = "rounded",
  --     source = "always",
  --     header = "",
  --     prefix = "",
  --   },
  -- }

  -- vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
end

local function lsp_highlight_document(client)
  -- print("in lsp_highlight_document")
  -- -- Set autocommands conditional on server_capabilities
  -- if client.server_capabilities.document_highlight then
  --   vim.api.nvim_exec(
  --     [[
  --   	 	augroup lsp_document_highlight
  --   	 	 	autocmd! * <buffer>
  --   	 	 	autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
  --   	 	 	autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
  --   	 	augroup END
  --   	]],
  --     false
  --   )
  -- end
  -- local illuminate = require("illuminate")
  -- illuminate.on_attach(client)
end

-- To instead override globally
-- local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
-- function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
-- 	opts = opts or {}
-- 	opts.border = opts.border or signs
-- 	return orig_util_open_floating_preview(contents, syntax, opts, ...)
-- end

local function lsp_keymaps(bufnr)
  local opts = { noremap = false, silent = false }
  --local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)

  vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua require('pretty_hover').hover()<CR>", opts)

  vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-M-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>fl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>qf", "<cmd>lua vim.lsp.buf.code_action({only=\"quickfix\"})<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "gl",
    '<cmd>lua vim.diagnostic.open_float(nil, {focus=false})<CR>',
    opts
  )
  vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.format({ async = true })' ]]
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>fo", "<cmd>Format<CR>", opts)
end

M.on_attach = function(client, bufnr)
  vim.notify("on_attach")
  -- if client.name == "tsserver" then -- or client.name == "jdt.ls" then
  --   client.server_capabilities.document_formatting = false
  -- end
  -- if client.name == "clangd" then
  --   client.server_capabilities.document_formatting = false
  -- end

  -- if client.name == "jdt.ls" then
  --   require("jdtls").setup_dap { hotcoderpalce = "auto" }
  --   require("jdtls.dap").setup_dap_main_class_configs();
  -- end

  print("attached:")
  -- lsp_keymaps(bufnr)
  -- lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true;

local cmp_nvim_lsp = require("cmp_nvim_lsp")

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return M
