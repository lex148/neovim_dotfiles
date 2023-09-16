
return {

  {
    "rcarriga/nvim-notify",
    opts = {},
    lazy = false,
    config = function()
      vim.notify = require('notify')
    end
  }


}
