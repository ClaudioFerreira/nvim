return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    -- Inicializa Mason
    require("mason").setup()

    -- LSP servers recomendados
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "ts_ls",
        "html",
        "cssls",
      },
      automatic_installation = true,
    })

    local lspconfig = vim.lsp

    -- Configuração de cada LSP
    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
        },
      },
    })

    vim.lsp.config("ts_ls", {})   -- Novo nome do antigo tsserver
    vim.lsp.config("html", {})
    vim.lsp.config("cssls", {})

    -- Habilita todos
    vim.lsp.enable("lua_ls")
    vim.lsp.enable("ts_ls")
    vim.lsp.enable("html")
    vim.lsp.enable("cssls")
  end,
}
