return {

  {
    "neovim/nvim-lspconfig",
    lazy = false,
    opts = {},
    config = function()

      local lspconfig = require('lspconfig')
      lspconfig.solargraph.setup({})
      lspconfig.tsserver.setup({})

      --lspconfig.emmet_language_server.setup({})
      lspconfig.ruby_ls.setup({})

      lspconfig.rust_analyzer.setup {
        settings = {
          ['rust-analyzer'] = {
               checkOnSave = {
                 command = "clippy"
               }
          },
        },
      }

    end
  },


}
