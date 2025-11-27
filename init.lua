
-- =============================
-- Neovim Config v4 (com controle de abas)
-- =============================
-- Inclui:
-- - Bufferline com ícones, números, botões de fechar
-- - Atalhos para navegar, fechar e mover abas
-- - Melhorias anteriores (ícones, splits, telescope, project.nvim, LSP moderno)

-- 1) Preferências base
vim.g.mapleader = ' '
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.mouse = 'a'

-- 2) lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ 'git', 'clone', '--filter=blob:none', 'https://github.com/folke/lazy.nvim.git', lazypath })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  { 'folke/tokyonight.nvim' },
  { 'nvim-tree/nvim-web-devicons' },
  { 'nvim-neo-tree/neo-tree.nvim', dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons', 'MunifTanjim/nui.nvim' } },
  { 'akinsho/bufferline.nvim', dependencies = 'nvim-tree/nvim-web-devicons' },
  { 'nvim-lualine/lualine.nvim', dependencies = 'nvim-tree/nvim-web-devicons' },
  { 'folke/which-key.nvim' },
  { 'neovim/nvim-lspconfig', lazy = true, init = function()
      local root = require('lazy.core.config').options.root .. '/nvim-lspconfig'
      vim.opt.runtimepath:append(root)
    end },
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'L3MON4D3/LuaSnip' },
  { 'nvim-telescope/telescope.nvim', tag = 'v0.1.9', dependencies = { 'nvim-lua/plenary.nvim' } },
  { 'ahmedkhalf/project.nvim' },
  { 'lewis6991/gitsigns.nvim' },
  { 'kdheepak/lazygit.nvim' },
  { 'akinsho/toggleterm.nvim', version = '*' },
  { 'mfussenegger/nvim-dap' },
  { 'rcarriga/nvim-dap-ui' },
})

-- 3) Visual e ícones
vim.cmd('colorscheme tokyonight')
require('nvim-web-devicons').setup()
require('lualine').setup({ icons_enabled = true })
require('bufferline').setup({
  options = {
    numbers = 'ordinal', -- mostra número da aba
    diagnostics = 'nvim_lsp',
    show_buffer_close_icons = true,
    show_close_icon = true,
    separator_style = 'slant',
    always_show_bufferline = true,
  }
})
require('gitsigns').setup()

-- 4) Navegação entre splits
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Mover para split esquerda' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Mover para split direita' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Mover para split abaixo' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Mover para split acima' })

-- 5) ToggleTerm
require('toggleterm').setup({ start_in_insert = true, persist_size = true, persist_mode = true, shade_terminals = false, direction = 'float' })
local function open_term(opts)
  local cmd = string.format(':ToggleTerm size=%d direction=%s<CR>', opts.size or 15, opts.dir)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(cmd, true, true, true), 'n', true)
end

-- 6) Telescope + project.nvim
local telescope = require('telescope')
local builtin = require('telescope.builtin')
require('project_nvim').setup({ detection_methods = { 'pattern', 'lsp' }, patterns = { '.git', 'package.json', 'tsconfig.json' } })
vim.api.nvim_create_autocmd({ 'BufEnter' }, {
  callback = function()
    local proj = require('project_nvim.project').get_project_root()
    if proj and proj ~= '' then vim.cmd('lcd ' .. proj) end
  end,
})
telescope.setup({ defaults = { mappings = { i = { ['<esc>'] = require('telescope.actions').close } } } })

-- 7) which-key + atalhos
local wk = require('which-key')
wk.add({
  -- Explorer
  { '<leader>fe', '<cmd>Neotree toggle<cr>', desc = 'Explorer' },
  -- Telescope
  { '<leader>ff', function() builtin.find_files({ cwd = vim.fn.getcwd() }) end, desc = 'Buscar arquivo' },
  { '<leader>fg', function() builtin.live_grep({ cwd = vim.fn.getcwd() }) end, desc = 'Buscar texto' },
  { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Buffers' },
  { '<leader>fh', '<cmd>Telescope help_tags<cr>', desc = 'Ajuda' },
  -- Git
  { '<leader>gg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
  -- Terminal
  { '<leader>tt', '<cmd>ToggleTerm<cr>', desc = 'Terminal último' },
  { '<leader>tf', function() open_term({ dir = 'float', size = 20 }) end, desc = 'Terminal flutuante' },
  { '<leader>th', function() open_term({ dir = 'horizontal', size = 15 }) end, desc = 'Terminal abaixo' },
  { '<leader>tv', function() open_term({ dir = 'vertical', size = 40 }) end, desc = 'Terminal lateral' },
  { '<leader>tT', function() open_term({ dir = 'tab', size = 20 }) end, desc = 'Terminal em tab' },
  -- Splits
  { '<leader>sv', '<cmd>vsplit<cr>', desc = 'Split vertical' },
  { '<leader>sh', '<cmd>split<cr>', desc = 'Split horizontal' },
  { '<leader>sc', '<cmd>close<cr>', desc = 'Fechar split' },
  -- Buffers / Abas
  { '<leader>bn', '<cmd>BufferLineCycleNext<cr>', desc = 'Próxima aba' },
  { '<leader>bp', '<cmd>BufferLineCyclePrev<cr>', desc = 'Aba anterior' },
  { '<leader>bc', '<cmd>bdelete<cr>', desc = 'Fechar aba atual' },
  { '<leader>b>', '<cmd>BufferLineMoveNext<cr>', desc = 'Mover aba para direita' },
  { '<leader>b<', '<cmd>BufferLineMovePrev<cr>', desc = 'Mover aba para esquerda' },
})

-- 8) LSP moderno
require('mason').setup()
require('mason-lspconfig').setup({ ensure_installed = { 'ts_ls', 'html', 'cssls', 'jsonls', 'kotlin_language_server' } })
local capabilities = require('cmp_nvim_lsp').default_capabilities()
for _, name in ipairs({ 'ts_ls', 'html', 'cssls', 'jsonls', 'kotlin_language_server' }) do
  vim.lsp.config(name, { capabilities = capabilities })
end
vim.lsp.enable({ 'ts_ls', 'html', 'cssls', 'jsonls', 'kotlin_language_server' })

-- 9) Autocomplete
local cmp = require('cmp')
cmp.setup({ snippet = { expand = function(args) require('luasnip').lsp_expand(args.body) end }, mapping = cmp.mapping.preset.insert({ ['<CR>'] = cmp.mapping.confirm({ select = true }) }), sources = cmp.config.sources({ { name = 'nvim_lsp' }, { name = 'buffer' }, { name = 'path' } }) })
