# Neovim Configuração Avançada (v4)

Esta configuração foi criada para desenvolvedores web (Node.js, Angular, React, NestJS) e iniciantes em mobile (Kotlin), mantendo uma experiência próxima ao VS Code.

## ✅ Visão Geral

- Gerenciador de plugins: **lazy.nvim**
- Interface moderna: **Neo-tree**, **Bufferline**, **Lualine**, ícones com **nvim-web-devicons**
- Tema: **TokyoNight**
- Busca avançada: **Telescope** + integração com **project.nvim**
- Terminal integrado: **ToggleTerm** (float, horizontal, vertical, tab)
- Git: **Gitsigns** + **LazyGit**
- LSP moderno: `vim.lsp.config` + `vim.lsp.enable` (Nvim 0.11+)
- Autocomplete: **nvim-cmp** + **LuaSnip**

## ✅ Instalação

1. Copie o arquivo `init.lua` para `~/.config/nvim/init.lua`.
2. Abra o Neovim e rode:
   ```vim
   :Lazy sync
   ```
3. Instale dependências:
   ```bash
   sudo apt install ripgrep
   ```
4. Instale uma **Nerd Font** no terminal (ex.: FiraCode Nerd Font).

## ✅ Dependências

- [Neovim >= 0.11](https://neovim.io/)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [Nerd Fonts](https://www.nerdfonts.com/font-downloads)

## ✅ Atalhos Úteis

### 🔍 Busca e Explorer

- `Space + f e` → Abrir/fechar **Neo-tree**
- `Space + f f` → Buscar arquivo no projeto
- `Space + f g` → Buscar texto no projeto (ripgrep)
- `Space + f b` → Buffers
- `Space + f h` → Ajuda

### 🖥️ Terminal

- `Space + t t` → Alternar terminal atual
- `Space + t f` → Terminal flutuante
- `Space + t h` → Terminal abaixo
- `Space + t v` → Terminal lateral
- `Space + t T` → Terminal em tab

### 🪟 Splits

- `Space + s v` → Split vertical
- `Space + s h` → Split horizontal
- `Space + s c` → Fechar split
- `Ctrl + h/j/k/l` → Navegar entre splits

### 📑 Abas (Bufferline)

- `Space + b n` → Próxima aba
- `Space + b p` → Aba anterior
- `Space + b c` → Fechar aba atual
- `Space + b >` → Mover aba para direita
- `Space + b <` → Mover aba para esquerda

### 🔗 Git

- `Space + g g` → Abrir LazyGit
- `Space + g s` → Stage hunk
- `Space + g r` → Reset hunk
- `Space + g p` → Preview hunk

### ⚙️ LSP

- `K` → Hover
- `g d` → Ir para definição
- `g D` → Ir para declaração
- `g i` → Ir para implementação
- `Space + r n` → Renomear símbolo
- `Space + c a` → Ação de código

## ✅ Dicas para Angular/NestJS

- Use **ToggleTerm** para rodar comandos:
  - `ng serve` → iniciar servidor Angular
  - `npm run start` → iniciar NestJS
- Abra terminal flutuante com `Space + t f` para manter código visível.

## ✅ Boas Práticas

- Abra Neovim dentro da pasta do projeto (`cd meu-projeto && nvim`).
- Use `:checkhealth` para verificar status dos plugins.
- Atualize Neovim para evitar avisos de deprecação.

---

Com esta configuração, você terá uma experiência próxima ao VS Code, com recursos avançados para produtividade e suporte completo para desenvolvimento web e mobile.
