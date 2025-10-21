
-- Configuração dos servidores LSP com nova API do Neovim

return {
  "neovim/nvim-lspconfig",
  config = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()

    -- Configurar TypeScript com ts_ls (novo nome)
    vim.lsp.start({
      name = "ts_ls",
      cmd = { "typescript-language-server", "--stdio" },
      filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
      root_dir = vim.fs.dirname(vim.fs.find({"package.json", "tsconfig.json"}, { upward = true })[1]),
      capabilities = capabilities,
    })

    -- Configurar ESLint
    vim.lsp.start({
      name = "eslint",
      cmd = { "vscode-eslint-language-server", "--stdio" },
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
      root_dir = vim.fs.dirname(vim.fs.find({".eslintrc.js", ".eslintrc.json"}, { upward = true })[1]),
      capabilities = capabilities,
    })
  end,
}
