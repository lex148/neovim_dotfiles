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
    opts = {
      ensure_installed = {
        "tsserver",
        "html",
        "csls",
      }
    },
    config = function()
      require("mason-lspconfig").setup()
      require 'lspconfig'.lua_ls.setup {}
    end
  },

  {
    "neovim/nvim-lspconfig",
    lazy = false,
    opts = {},
    config = function()
    end
  },


  {
    "simrat39/rust-tools.nvim",
    lazy = false,
    config = function()
      local rt = require("rust-tools")
      rt.setup({
        server = {
          on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
          end,
        },
      })
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
