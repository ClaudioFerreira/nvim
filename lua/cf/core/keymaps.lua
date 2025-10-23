-- Configuração de atalhos para splits e navegação entre janelas

vim.g.mapleader = " "
local keymap = vim.keymap

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Navegação entre splits com Ctrl + h/j/k/l
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Mover para split à esquerda" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Mover para split à direita" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Mover para split abaixo" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Mover para split acima" })