return {
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup({
      size = 20,
      open_mapping = [[<C-\>]],
      direction = "float",
    })

    local wk = require("which-key")
    wk.register({
      ["<leader>tt"] = { "<cmd>ToggleTerm<CR>", "Abrir terminal integrado" },
    })
  end,
}
