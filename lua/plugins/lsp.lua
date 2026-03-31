
return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "tsserver",
        "html",
        "cssls",
        "angularls",
        "kotlin_language_server",
        "jsonls",
        "eslint",
      },
    })

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Lua
    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      settings = {
        Lua = { diagnostics = { globals = { "vim" } } },
      },
    })

    -- TypeScript
    vim.lsp.config("tsserver", {
      capabilities = capabilities,
      settings = {
        typescript = {
          preferences = {
            importModuleSpecifierPreference = "relative",
          },
        },
      },
    })

    -- Angular
    vim.lsp.config("angularls", {
      capabilities = capabilities,
      filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx" },
    })

    -- Kotlin
    vim.lsp.config("kotlin_language_server", {
      capabilities = capabilities,
      filetypes = { "kotlin" },
    })

    -- JSON
    vim.lsp.config("jsonls", {
      capabilities = capabilities,
    })

    -- HTML
    vim.lsp.config("html", {
      capabilities = capabilities,
    })

    -- CSS
    vim.lsp.config("cssls", {
      capabilities = capabilities,
    })

    -- Keymaps de LSP
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true })
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { noremap = true })
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { noremap = true })
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { noremap = true })

    -- Keymaps de LSP
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true })
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { noremap = true })
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { noremap = true })
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { noremap = true })
  end,
}
