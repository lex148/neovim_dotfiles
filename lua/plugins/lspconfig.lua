return {

  {
    "nvimtools/none-ls.nvim",
    lazy = false,
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
      "nvim-lua/plenary.nvim"
    },
    config = function()
      local null_ls = require("null-ls")
      local formatting = null_ls.builtins.formatting
      --local diagnostics = null_ls.builtins.diagnostics

      null_ls.setup( {
        sources = {
          require("none-ls.diagnostics.eslint_d"),
          require("none-ls.formatting.eslint_d"),
        }
      })

    end
  },


  {
    "neovim/nvim-lspconfig",
    lazy = false,
    opts = {},

    -- dependencies = {
    --   "nvimtools/none-ls.nvim",
    -- },

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



  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    -- keys = {
    --   {
    --     -- Customize or remove this keymap to your liking
    --     "<leader>f",
    --     function()
    --       require("conform").format({ async = true, lsp_fallback = true })
    --     end,
    --     mode = "",
    --     desc = "Format buffer",
    --   },
    -- },
    -- Everything in opts will be passed to setup()
    opts = {
      -- Define your formatters
      formatters_by_ft = {
        -- lua = { "stylua" },
        -- python = { "isort", "black" },
        javascript = { { "prettierd", "prettier" } },
      },
      -- Set up format-on-save
      format_on_save = { timeout_ms = 500, lsp_fallback = true },
      -- Customize formatters
      formatters = {
        shfmt = {
          prepend_args = { "-i", "2" },
        },
      },
    },
    init = function()
      -- If you want the formatexpr, here is the place to set it
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
  }




}
