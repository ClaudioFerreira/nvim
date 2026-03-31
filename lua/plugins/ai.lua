return {
  {
    "github/copilot.vim",
    config = function()
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true

      -- Mapping Tab para aceitar Copilot suggestion
      vim.keymap.set("i", "<C-g>", 'copilot#Accept("<CR>")', {
        expr = true,
        noremap = true,
        silent = true,
      })

      vim.keymap.set("i", "<C-n>", "<Plug>(copilot-next)", { noremap = true, silent = true })
      vim.keymap.set("i", "<C-p>", "<Plug>(copilot-previous)", { noremap = true, silent = true })
      vim.keymap.set("i", "<C-d>", "<Plug>(copilot-dismiss)", { noremap = true, silent = true })
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim" },
    },
    config = function()
      local chat = require("CopilotChat")
      chat.setup({
        debug = false,
      })

      vim.keymap.set("n", "<leader>ai", function()
        require("CopilotChat").open()
      end, { noremap = true, silent = true, desc = "Copilot Chat" })

      vim.keymap.set("n", "<leader>aid", function()
        require("CopilotChat").ask("Describe the selected code")
      end, { noremap = true, silent = true, desc = "Describe code" })

      vim.keymap.set("v", "<leader>ai", function()
        require("CopilotChat").open()
      end, { noremap = true, silent = true, desc = "Copilot Chat" })
    end,
  },
}
