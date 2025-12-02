-- lua/core/keymaps.lua

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Salvar e sair
map("n", "<leader>w", ":w<CR>", opts)
map("n", "<leader>q", ":q<CR>", opts)

-- Navegar splits
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)

-- NvimTree
map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Lazygit
map("n", "<leader>lg", ":LazyGit<CR>", opts)
