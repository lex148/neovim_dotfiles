
return {

  {
    'stevearc/oil.nvim',
    opts = {
      columns = {
        "icon",
        --"permissions",
        "size",
        --"mtime",
      },

      win_options = {
        wrap = false,
        signcolumn = "no",
        cursorcolumn = false,
        foldcolumn = "0",
        spell = true,
        list = false,
        conceallevel = 3,
        concealcursor = "nvic",
      },

      view_options = {
        show_hidden = true,
      }

    },
    cmd = "Oil",
    keys = {
      { "<leader>n", "<CMD>Oil<CR>" },
    },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  }


}
