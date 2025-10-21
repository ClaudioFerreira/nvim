
-- Configuração do plugin null-ls para formatação e linting

return {
  "jose-elias-alvarez/null-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- Formatação com prettier
        null_ls.builtins.formatting.prettier,

        -- Linting com eslint_d
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.code_actions.eslint_d,
      },
    })
  end,
}
