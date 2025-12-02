# Minha Configuração Neovim — Guia Completo para Iniciantes

Este README foi criado para ser um guia simples, bonito e útil para quem está começando no Neovim usando uma configuração modular com **Lazy.nvim**, **LSP**, **telescope**, **treesitter**, **lualine**, **gitsigns** e atalhos essenciais.

---

## 🚀 Introdução

Este documento explica:

* Estrutura da sua configuração
* Atalhos principais (clássicos e personalizados)
* Como navegar, copiar e colar
* Como usar o LSP e os plugins
* Dicas para iniciantes

---

## 📁 Estrutura da Configuração

Sua configuração segue o padrão modular usando o **Lazy**.

```
~/.config/nvim/
├── init.lua
├── lua/
│   ├── core/
│   │   ├── options.lua
│   │   ├── keymaps.lua
│   │   └── lazy.lua
│   └── plugins/
│       ├── lsp.lua
│       ├── treesitter.lua
│       ├── telescope.lua
│       ├── gitsigns.lua
│       ├── lualine.lua
│       └── outros...
```

---

## ⌨️ Atalhos Essenciais

### 🔹 Movimentação

* `h` → Esquerda
* `j` → Baixo
* `k` → Cima
* `l` → Direita
* `w` → Avança para próxima palavra
* `b` → Volta para palavra anterior
* `gg` → Início do arquivo
* `G` → Fim do arquivo

### 🔹 Edição

* `i` → Inserir antes do cursor
* `a` → Inserir depois do cursor
* `o` → Nova linha abaixo
* `dd` → Apagar linha
* `yy` → Copiar linha
* `p` → Colar abaixo
* `u` → Desfazer
* `<C-r>` → Refazer

### 🔹 Seleção

* `v` → Visual
* `V` → Visual linha
* `<C-v>` → Visual bloco

---

## 🧭 Navegação entre janelas e arquivos

### Janelas (splits)

* `<C-h>` → Janela esquerda
* `<C-l>` → Janela direita
* `<C-j>` → Janela abaixo
* `<C-k>` → Janela acima

### Buffers

* `:bd` → Fechar buffer
* `<Tab>` → Próximo buffer
* `<S-Tab>` → Buffer anterior

---

## 🔍 Telescope — Busca Inteligente

* `<leader>ff` → Buscar arquivos
* `<leader>fg` → Buscar texto (grep)
* `<leader>fb` → Buffers abertos
* `<leader>fh` → Ajuda

---

## 🌳 Treesitter

Fornece highlight moderno, melhor entendimento da sintaxe.

Nada a fazer: é automático.

---

## 🧠 LSP — Autocomplete e IntelliSense

* `gd` → Ir para definição
* `gr` → Referências
* `K` → Hover
* `<leader>rn` → Renomear
* `<leader>ca` → Code Actions
* `<leader>f` → Format

---

## 🌈 Interface (lualine, gitsigns)

* `gitsigns` mostra alterações no gutter
* `lualine` deixa a statusbar mais agradável

---

## 📦 Lazy.nvim

### Abrir painel do Lazy

```
:Lazy
```

### Atualizar plugins

```
:Lazy update
```

---

## 📚 Dicas para Iniciantes

* Evite usar o mouse → Neovim é mais rápido sem ele
* Treine os movimentos básicos (hjkl)
* Use o `telescope` sempre que puder
* Não decore tudo de uma vez, pratique aos poucos
* Não tenha medo de abrir o `:help`

---

## 🤝 Contribuições

Sinta-se livre para adicionar novos plugins e atalhos conforme sua necessidade.
