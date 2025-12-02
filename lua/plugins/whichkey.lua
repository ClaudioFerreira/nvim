
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")
    wk.setup()

    wk.add({
      -- Explorer e busca
      { "<leader>f", group = "Files" }, -- submenu
      { "<leader>fe", "<cmd>Neotree toggle<cr>", desc = "Explorer" },
      { "<leader>ff", function() require("telescope.builtin").find_files({ cwd = vim.fn.getcwd() }) end, desc = "Buscar arquivo" },
      { "<leader>fg", function() require("telescope.builtin").live_grep({ cwd = vim.fn.getcwd() }) end, desc = "Buscar texto" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Ajuda" },

      -- Terminal
      { "<leader>t", group = "Terminal" },
      { "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Terminal (último)" },
      { "<leader>tf", function() vim.cmd("ToggleTerm direction=float size=20") end, desc = "Flutuante" },
      { "<leader>th", function() vim.cmd("ToggleTerm direction=horizontal size=15") end, desc = "Horizontal" },
      { "<leader>tv", function() vim.cmd("ToggleTerm direction=vertical size=40") end, desc = "Vertical" },
      { "<leader>tT", function() vim.cmd("ToggleTerm direction=tab size=20") end, desc = "Tab" },

      -- Splits
      { "<leader>s", group = "Splits" },
      { "<leader>sv", "<cmd>vsplit<cr>", desc = "Vertical" },
      { "<leader>sh", "<cmd>split<cr>", desc = "Horizontal" },
      { "<leader>sc", "<cmd>close<cr>", desc = "Fechar" },

      -- Abas (Bufferline)
      { "<leader>b", group = "Buffers" },
      { "<leader>bn", "<cmd>BufferLineCycleNext<cr>", desc = "Próxima" },
      { "<leader>bp", "<cmd>BufferLineCyclePrev<cr>", desc = "Anterior" },
      { "<leader>bc", "<cmd>bdelete<cr>", desc = "Fechar" },

      -- Git
      { "<leader>g", group = "Git" },
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "Abrir LazyGit" },
    })

  end,
}
