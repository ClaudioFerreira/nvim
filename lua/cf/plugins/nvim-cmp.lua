-- Configuração completa do autocompletar com nvim-cmp + luasnip + lspkind

local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
  vim.notify("nvim-cmp não encontrado", vim.log.levels.WARN)
  return
end

local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
  vim.notify("luasnip não encontrado", vim.log.levels.WARN)
  return
end

local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
  vim.notify("lspkind não encontrado", vim.log.levels.WARN)
  return
end

-- Carrega snippets do VSCode (como Angular, React, etc)
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
  completion = {
    completeopt = "menu,menuone,noinsert,noselect",
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  formatting = {
    format = lspkind.cmp_format({
      mode = "symbol_text",
      maxwidth = 50,
      ellipsis_char = "...",
      menu = {
        buffer = "[Buf]",
        nvim_lsp = "[LSP]",
        luasnip = "[Snip]",
        path = "[Path]",
      },
    }),
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  }),
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  experimental = {
    ghost_text = true, -- mostra sugestão inline (leve e útil no tablet)
  },
})
