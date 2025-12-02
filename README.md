# 🚀 Minha Configuração Neovim — Guia Completo para Iniciantes

Este guia foi criado para quem deseja usar uma configuração moderna e modular do **Neovim**, com recursos avançados como **Lazy.nvim**, **LSP**, **Telescope**, **Treesitter**, **ToggleTerm**, **Bufferline**, **Gitsigns** e atalhos organizados.

---

## 📦 Estrutura da Configuração

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
│       ├── telescope.lua
│       ├── toggleterm.lua
│       ├── bufferline.lua
│       ├── whichkey.lua
│       ├── gitsigns.lua
│       └── outros...
```

---

## 🔧 Instalação

### macOS

```bash
brew install neovim ripgrep fd lazygit
```

### Ubuntu

```bash
sudo apt update
sudo apt install neovim ripgrep fd-find lazygit
# Ajuste fd
ln -s $(which fdfind) ~/.local/bin/fd
```

### Nerd Fonts

Baixe e instale uma [Nerd Font](https://www.nerdfonts.com/font-downloads) e configure no seu terminal.

---

## ✅ Dependências

- **Neovim >= 0.11**
- **ripgrep** (para busca com Telescope)
- **fd** (para busca rápida de arquivos)
- **LazyGit** (integração com Git)
- **Nerd Fonts** (ícones)

---

## ⌨️ Atalhos Essenciais

### 🔹 Movimentação

- `h/j/k/l` → Esquerda/Baixo/Cima/Direita
- `w` → Próxima palavra
- `b` → Palavra anterior
- `gg` → Início do arquivo
- `G` → Fim do arquivo

### 🔹 Edição

- `i` → Inserir antes do cursor
- `a` → Inserir depois do cursor
- `o` → Nova linha abaixo
- `dd` → Apagar linha
- `yy` → Copiar linha
- `p` → Colar abaixo
- `u` → Desfazer
- `<C-r>` → Refazer

### 🔹 Seleção

- `v` → Visual
- `V` → Visual linha
- `<C-v>` → Visual bloco

---

## 🧭 Navegação entre janelas e arquivos

### Splits

- `<C-h>` → Janela esquerda
- `<C-l>` → Janela direita
- `<C-j>` → Janela abaixo
- `<C-k>` → Janela acima

### Buffers

- `<leader>bn` → Próxima aba
- `<leader>bp` → Aba anterior
- `<leader>bc` → Fechar aba

---

## 🔍 Busca (Telescope)

- `<leader>ff` → Buscar arquivos
- `<leader>fg` → Buscar texto (grep)
- `<leader>fb` → Buffers abertos
- `<leader>fh` → Ajuda

---

## 🖥️ Terminal (ToggleTerm)

- `<leader>tt` → Alternar terminal
- `<leader>tf` → Terminal flutuante
- `<leader>th` → Terminal abaixo
- `<leader>tv` → Terminal lateral
- `<leader>tT` → Terminal em tab

---

## 🌳 Treesitter

Highlight moderno e parsing avançado. Funciona automaticamente.

---

## 🧠 LSP — Autocomplete e IntelliSense

- `gd` → Ir para definição
- `gD` → Declaração
- `gi` → Implementação
- `K` → Hover
- `<leader>rn` → Renomear
- `<leader>ca` → Code Actions

---

## 🔗 Git

- `<leader>gg` → Abrir LazyGit
- `gitsigns` mostra alterações no gutter

---

## 📦 Lazy.nvim

- Abrir painel: `:Lazy`
- Atualizar plugins: `:Lazy update`

---

## 💡 Dicas para Angular/NestJS

- Use **ToggleTerm** para rodar comandos:
  - `ng serve` → iniciar Angular
  - `npm run start` → iniciar NestJS
- Abra terminal flutuante com `<leader>tf` para manter código visível.

---

## 🏆 Boas Práticas

- Abra Neovim dentro da pasta do projeto (`cd meu-projeto && nvim`).
- Use `:checkhealth` para verificar status.
- Atualize Neovim para evitar avisos.
- Pratique movimentos básicos (hjkl) e atalhos aos poucos.

---

## 🤝 Contribuições

Sinta-se livre para adicionar novos plugins e atalhos conforme sua necessidade.
