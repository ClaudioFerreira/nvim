
return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 20,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_terminals = false,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = "float", -- padrão flutuante
    })

    -- Funções para abrir terminais em diferentes direções
    local function open_term(opts)
      local cmd = string.format(":ToggleTerm size=%d direction=%s<CR>", opts.size or 15, opts.dir)
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(cmd, true, true, true), "n", true)
    end

    -- Integração com which-key (se carregado)
    local ok, wk = pcall(require, "which-key")
    if ok then
      wk.add({
        { "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Terminal (último)" },
        { "<leader>tf", function() open_term({ dir = "float", size = 20 }) end, desc = "Terminal flutuante" },
        { "<leader>th", function() open_term({ dir = "horizontal", size = 15 }) end, desc = "Terminal abaixo" },
        { "<leader>tv", function() open_term({ dir = "vertical", size = 40 }) end, desc = "Terminal lateral" },
        { "<leader>tT", function() open_term({ dir = "tab", size = 20 }) end, desc = "Terminal em tab" },
      })
    end
  end,
}
