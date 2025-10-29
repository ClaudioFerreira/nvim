return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    -- Inicializa o Mason
    require("mason").setup({
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
      log_level = vim.log.levels.INFO,
      max_concurrent_installers = 4,
    })

    -- Inicializa o Mason LSPConfig
    local mason_lspconfig = require("mason-lspconfig")

    -- Lista de servidores LSP para instalar automaticamente
    local servers = {
      "ts_ls",         -- TypeScript / JavaScript
      "html",          -- HTML
      "cssls",         -- CSS
      "jsonls",        -- JSON
      "lua_ls",        -- Lua
      "bashls",        -- Bash
      "yamlls",        -- YAML
      "dockerls",      -- Dockerfile
      "marksman",      -- Markdown
      "pyright",       -- Python
    }

    -- Configura o mason-lspconfig
    mason_lspconfig.setup({
      ensure_installed = servers,
      automatic_installation = true,
    })

    -- Integra com o nvim-lspconfig
    local lspconfig = require("lspconfig")

    for _, server in ipairs(servers) do
      local opts = {}

      -- Configurações específicas por servidor (exemplo para Lua)
      if server == "lua_ls" then
        opts.settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
          },
        }
      end

      lspconfig[server].setup(opts)
    end
  end,
}
