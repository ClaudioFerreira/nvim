# Neovim Config - Claudio Ferreira

Configuração personalizada do Neovim para desenvolvimento web com foco em Angular, NestJS e Node.js.

## 📁 Estrutura do Projeto

```
.config/nvim
├── init.lua                # Arquivo principal de inicialização
├── lazy-lock.json          # Cache de plugins gerenciados pelo lazy.nvim
├── lua
│   └── cf
│       ├── core            # Configurações básicas
│       │   ├── init.lua
│       │   ├── keymaps.lua
│       │   └── options.lua
│       ├── lazy.lua        # Configuração do lazy.nvim
│       ├── plugins         # Plugins organizados por funcionalidade
│       │   ├── init.lua
│       │   ├── which-key.lua
│       │   ├── formatting.lua
│       │   ├── lsp
│       │   │   ├── lspconfig.lua
│       │   │   └── mason.lua
│       └── snippets        # Snippets personalizados
└── README.md
```

## 🚀 Instalação

1. Clone o repositório:

```bash
git clone https://github.com/ClaudioFerreira/nvim ~/.config/nvim
```

2. Instale os binários necessários:

```bash
npm install -g prettier eslint_d typescript typescript-language-server vscode-langservers-extracted
```

3.  Instalação do LazyGit
    curl https://raw.githubusercontent.com/jesseduffield/lazygit/master/scripts/install_update_linux.sh | bash

4.  Abra o Neovim e sincronize os plugins:

```vim
:Lazy sync
:MasonInstallAll
:TSUpdate
```

## 🧩 Plugins Principais

- `which-key.nvim`: Menu de atalhos interativo
- `nvim-cmp`: Autocompletion
- `LuaSnip`: Snippets
- `null-ls.nvim`: Formatação e linting
- `nvim-treesitter`: Syntax highlight avançado
- `toggleterm.nvim`: Terminal integrado
- `nvim-tree.lua`: Navegação de arquivos
- `telescope.nvim`: Busca inteligente
- `gitsigns.nvim`: Integração com Git

## ⌨️ Atalhos Úteis

- `<leader>t` → Controle de abas
- `<leader>w` → Controle de janelas
- `<leader>r` → Rodar NestJS (`npm run dev`)
- `<leader>ng` → Rodar Angular (`ng serve`)
- `<leader>tt` → Abrir terminal integrado

## 🧠 Observações

- O gerenciador de plugins usado é o `lazy.nvim`
- Os atalhos são organizados com `which-key`
- A configuração é modular e fácil de expandir

---

## 🖥️ Terminal Integrado

Este setup inclui o plugin `toggleterm.nvim`, que permite abrir um terminal dentro do Neovim sem sair do editor.

### 🔧 Instalação

O plugin já está incluído em `plugins/init.lua`:

```lua
"akinsho/toggleterm.nvim"
```

### ⚙️ Configuração

A configuração está em `plugins/toggleterm.lua`:

```lua
require("toggleterm").setup({
  size = 20,
  open_mapping = [[<c-\>]],
  direction = "horizontal",
})
```

### ⌨️ Atalhos

- `<leader>tt` → Abre o terminal integrado
- `<C-\>` → Atalho padrão para abrir/fechar o terminal

### 📦 Exemplos de uso

- Rodar comandos como `npm install`, `ng serve`, `git status` diretamente no terminal do Neovim.
- Usar múltiplos terminais com diferentes direções (`float`, `vertical`, `tab`).

---

Feito com ❤️ por Claudio Ferreira
