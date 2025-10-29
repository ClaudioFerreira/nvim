local lspconfig = require("lspconfig")

-- Protege contra erros se cmp_nvim_lsp não estiver disponível
local ok_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not ok_cmp then
  vim.notify("cmp_nvim_lsp não encontrado", vim.log.levels.WARN)
  return
end

-- Capabilities (autocompletar inteligente)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Função executada quando o LSP é anexado a um buffer
local on_attach = function(_, bufnr)
  local opts = { buffer = bufnr, silent = true }
  local keymap = vim.keymap.set

  keymap("n", "gd", vim.lsp.buf.definition, opts)
  keymap("n", "gD", vim.lsp.buf.declaration, opts)
  keymap("n", "gi", vim.lsp.buf.implementation, opts)
  keymap("n", "gr", vim.lsp.buf.references, opts)
  keymap("n", "K", vim.lsp.buf.hover, opts)
  keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
  keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  keymap("n", "[d", vim.diagnostic.goto_prev, opts)
  keymap("n", "]d", vim.diagnostic.goto_next, opts)
  keymap("n", "<leader>e", vim.diagnostic.open_float, opts)
  keymap("n", "<leader>q", vim.diagnostic.setloclist, opts)

  -- Formatação automática antes de salvar (se suportado)
  if vim.lsp.buf.format then
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ async = false })
      end,
    })
  end
end

-- Configurações específicas por servidor
local servers = {
  ts_ls = {
    settings = {
      javascript = { suggest = { autoImports = true } },
      typescript = {
        suggest = { autoImports = true },
        format = { semicolons = "insert" },
      },
    },
  },
  angularls = {},
  eslint = {
    settings = {
      format = { enable = true },
    },
  },
  html = {},
  cssls = {},
  jsonls = {},
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = { globals = { "vim" } },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false,
        },
        telemetry = { enable = false },
      },
    },
  },
  pyright = {
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          useLibraryCodeForTypes = true,
          diagnosticMode = "workspace",
        },
      },
    },
  },
  bashls = {},
  dockerls = {},
  yamlls = {},
  marksman = {},
}

-- Aplica as configurações padrão + específicas de cada servidor
for name, opts in pairs(servers) do
  opts.capabilities = capabilities
  opts.on_attach = on_attach
  lspconfig[name].setup(opts)
end

-- Diagnósticos visuais aprimorados
vim.diagnostic.config({
  virtual_text = { spacing = 4, prefix = "●" },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})

-- Ícones para diagnósticos (ajuda na visualização em terminal)
local signs = { Error = "✘", Warn = "▲", Hint = "⚑", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
