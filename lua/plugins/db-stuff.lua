return {


  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = {
      "mfussenegger/nvim-dap"
    },
    config = function()
      require("dapui").setup()

      local dap, dapui = require("dap"), require("dapui")

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      vim.keymap.set("n", "<C-h>", ':DapStepOut<CR>')
      vim.keymap.set("n", "<C-j>", ':DapStepOver<CR>')
      vim.keymap.set("n", "<C-l>", ':DapStepInto<CR>')
      vim.keymap.set("n", "<leader>b", ':DapToggleBreakpoint<CR>')
      vim.keymap.set("n", "<C-c>", ':DapContinue<CR>')
      vim.keymap.set("n", "<C-x>", ':DapTerminate<CR>')
    end
  },


}
