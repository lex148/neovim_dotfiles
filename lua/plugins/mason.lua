return {

  {
    "williamboman/mason.nvim",
    lazy = false,
    opts = {},
    config = function()
      require("mason").setup()
    end
  },

  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    config = function()
      local cmp_nvim_lsp = require('cmp_nvim_lsp')
      local lspconfig = require('lspconfig')
      --local capabilities = lspconfig.capabilities
      require("mason-lspconfig").setup({
        ensure_installed = {
          'rust_analyzer',
          'lua_ls',
          'tsserver',
          'html',
          'cssls'
        },
        handlers = {

          ['cssls'] = function()
            lspconfig.cssls.setup({
              capabilities = cmp_nvim_lsp.default_capabilities()
            })
          end,

          ['tsserver'] = function()
            lspconfig.tsserver.setup({
              settings = {
                completions = {
                  completeFunctionCalls = true
                }
              }
            })
          end
        }
      })
    end
  },

  {
    "neovim/nvim-lspconfig",
    lazy = false,
    opts = {},
    config = function()
    end
  },


  --{
  --  "onsails/lspkind.nvim",
  --  opts = {},
  --  config = function()
  --  end
  --}

  -- {
  --   'nvimdev/lspsaga.nvim',
  --   opts = {
  --     -- keybinds for navigation in lspsaga window
  --     scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
  --     -- use enter to open file with definition preview
  --     definition = {
  --       edit = "<CR>",
  --     },
  --     ui = {
  --       colors = {
  --         normal_bg = "#022746",
  --       },
  --     },
  --   },
  --   --config = function()
  --   --  require('lspsaga').setup({})
  --   --end,
  --   dependencies = {
  --     'nvim-treesitter/nvim-treesitter', -- optional
  --     'nvim-tree/nvim-web-devicons'      -- optional
  --   }
  -- }


}
