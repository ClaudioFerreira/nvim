
-- Configuração dos servidores LSP usando a nova API do Neovim

return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")
    local capabilities = vim.lsp.protocol.make_client_capabilities()

    -- Configurar TypeScript com ts_ls (novo nome)
    lspconfig.tsserver.setup({
      capabilities = capabilities,
    })

    -- Configurar ESLint
    lspconfig.eslint.setup({
      capabilities = capabilities,
    })
  end,
}
