-- Configuração de formatação automática via null-ls (agora integrado ao none-ls)

local null_ls_status, null_ls = pcall(require, "null-ls")
if not null_ls_status then
  vim.notify("null-ls não encontrado", vim.log.levels.WARN)
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
  sources = {
    -- 🌐 Web / Frontend
    formatting.prettier.with({
      extra_filetypes = { "svelte", "astro", "json", "yaml", "markdown" },
      extra_args = { "--single-quote", "--jsx-single-quote", "--print-width", "100" },
    }),

    diagnostics.eslint_d,
    code_actions.eslint_d,

    -- 🐍 Python
    formatting.black.with({ extra_args = { "--fast" } }),
    diagnostics.flake8,

    -- 🧠 Lua
    formatting.stylua,

    -- 🐚 Shell
    formatting.shfmt,
    diagnostics.shellcheck,
  },

  on_attach = function(client, bufnr)
    -- Formatação automática antes de salvar
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = "LspFormatting", buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
})

-- Comando manual caso queira forçar formatação
vim.api.nvim_create_user_command("Format", function()
  vim.lsp.buf.format({ async = true })
end, {})
