
-- Configuracao do terminal integrado com toggleterm.nvim

-- Importa o plugin
local toggleterm = require("toggleterm")

-- Inicializa com configuracoes padrao
toggleterm.setup({
  size = 20, -- altura do terminal horizontal
  open_mapping = [[<C-\>]], -- atalho para abrir/fechar terminal
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = "horizontal", -- tipo de terminal: horizontal, vertical, float, tab
})

-- Atalho via which-key
local wk = require("which-key")
wk.register({
  ["<leader>tt"] = { "<cmd>ToggleTerm<CR>", "Abrir terminal integrado" },
})
