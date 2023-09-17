return {



  {
    "simrat39/rust-tools.nvim",
    --lazy = false,
    config = function()
      local rt = require("rust-tools")

      local mason_registry = require("mason-registry")
      local codelldb = mason_registry.get_package("codelldb")
      local extension_path = codelldb:get_install_path() .. "/extension/"
      local codelldb_path = extension_path .. "adapter/codelldb"
      local liblldb_path = extension_path .. "lldb/lib/liblldb.so"

      rt.setup({
        dap = {
          adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
        },
        server = {
          on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
          end,
        },
        tools = {
          hover_actions = {
            auto_focus = true,
          },
        },

      })
    end
  },


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
