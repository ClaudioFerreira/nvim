return {
  "folke/which-key.nvim",
  config = function()
    local wk = require("which-key")

    wk.setup({})

    -- Atalhos agrupados
    wk.register({
      ["<leader>t"] = {
        name = "+tabs",
        o = { "<cmd>tabnew<CR>", "Open new tab" },
        x = { "<cmd>tabclose<CR>", "Close tab" },
        n = { "<cmd>tabn<CR>", "Next tab" },
        p = { "<cmd>tabp<CR>", "Previous tab" },
        f = { "<cmd>tabnew %<CR>", "Move buffer to new tab" },
      },
      ["<leader>w"] = {
        name = "+windows",
        sv = { "<C-w>v", "Split vertical" },
        sh = { "<C-w>s", "Split horizontal" },
        se = { "<C-w>=", "Equal size" },
        sx = { "<cmd>close<CR>", "Close split" },
      },
      ["<leader>ng"] = { ":!ng serve<CR>", "Run Angular" },
      ["<leader>tt"] = { "<cmd>ToggleTerm<CR>", "Open terminal" },
      ["<leader>s"] = {
        name = "+splits",
        v = { "<C-w>v", "Split vertical" },
        h = { "<C-w>s", "Split horizontal" },
        e = { "<C-w>=", "Equal size" },
        x = { "<cmd>close<CR>", "Close split" },
      },
    })
  end,
}