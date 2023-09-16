return {

  {
    'sainnhe/gruvbox-material',
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    opts = {},
    config = function()
      --require('gruvbox-material').setup({})
      vim.cmd("let g:gruvbox_material_background = 'soft'")
      --vim.cmd("let g:gruvbox_material_background = 'midium'")
      --vim.cmd("let g:gruvbox_material_background = 'hard'")
      vim.cmd("colorscheme gruvbox-material")
    end,
  },




  --{
  --  "luisiacc/gruvbox-baby",
  --  branch = 'main',
  --  config = function()
  --    vim.cmd [[colorscheme gruvbox-baby]]
  --    --local status, _ = pcall(vim.cmd, "colorscheme gruvbox-baby")
  --  end
  --},

  --{
  --  'ribru17/bamboo.nvim',
  --  lazy = false,
  --  priority = 1000,
  --  config = function()
  --    require('bamboo').setup {
  --      style = 'multiplex',
  --      -- optional configuration here
  --    }
  --    require('bamboo').load()
  --  end,
  --}


  --{
  --  'rebelot/kanagawa.nvim',
  --  lazy = false,    -- make sure we load this during startup if it is your main colorscheme
  --  priority = 1000, -- make sure to load this before all the other start plugins
  --  config = function()
  --    require('kanagawa').setup({})
  --    vim.cmd("colorscheme kanagawa")
  --  end,
  --},


  --{
  --  'ramojus/mellifluous.nvim',
  --  lazy = false,    -- make sure we load this during startup if it is your main colorscheme
  --  priority = 1000, -- make sure to load this before all the other start plugins
  --  config = function()
  --    require('mellifluous').setup({})
  --    vim.cmd("colorscheme mellifluous")
  --  end,
  --},


  --{
  --  "morhetz/gruvbox",
  --  config = function()
  --    local status, _ = pcall(vim.cmd, "colorscheme gruvbox")
  --  end
  --}
}
