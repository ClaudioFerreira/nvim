return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "mfussenegger/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    dapui.setup()

    -- Configuração para Kotlin/Android
    dap.configurations.kotlin = {
      {
        type = "kotlin",
        name = "Debug Kotlin",
        request = "launch",
        preLaunchTask = "build",
        postDebugTask = "cleanupDebug",
        mainClass = "${classPathRunnable}",
        projectName = "${workspaceFolder}",
        cwd = "${workspaceFolder}",
        console = "integratedTerminal",
      },
    }

    -- Node.js / NestJS
    dap.configurations.javascript = {
      {
        name = "Launch Node",
        type = "node2",
        request = "launch",
        program = "${workspaceFolder}/dist/main.js",
        restart = true,
        protocol = "inspector",
        console = "integratedTerminal",
      },
    }

    dap.configurations.typescript = dap.configurations.javascript

    -- Keymaps para Debug
    vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, { noremap = true, desc = "Toggle Breakpoint" })
    vim.keymap.set("n", "<leader>ds", dap.continue, { noremap = true, desc = "Continue/Start Debug" })
    vim.keymap.set("n", "<leader>dn", dap.step_over, { noremap = true, desc = "Step Over" })
    vim.keymap.set("n", "<leader>di", dap.step_into, { noremap = true, desc = "Step Into" })
    vim.keymap.set("n", "<leader>do", dap.step_out, { noremap = true, desc = "Step Out" })
    vim.keymap.set("n", "<leader>dui", function()
      require("dapui").toggle()
    end, { noremap = true, desc = "Toggle DAP UI" })

    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end
  end,
}
