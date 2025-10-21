
local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

-- Capabilities para autocompletion
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Configurar servidores LSP
lspconfig.tsserver.setup({ capabilities = capabilities })
lspconfig.eslint.setup({ capabilities = capabilities })
