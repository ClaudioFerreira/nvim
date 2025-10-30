Perfeito 👍
Aqui está o README.md completo (em puro Markdown, sem formatação da interface — pode copiar e colar direto no arquivo README.md do seu projeto):


---

# 🛠️ Configuração Neovim (cf/nvim)

Ambiente completo para desenvolvimento **moderno**, com **LSP**, **autocompletar**, **formatação automática**, e **Mason** para instalação de linguagens.  
Compatível com **Neovim 0.11+** e **Lazy.nvim**.

---

## 🚀 Requisitos

Antes de começar, garanta que o ambiente possui:

### 🧰 Dependências básicas

```bash
sudo apt update
sudo apt install -y git curl unzip neovim python3-venv nodejs npm

> ✅ É necessário ter Neovim 0.11 ou superior
Verifique com:

nvim --version




---

🧩 Estrutura do projeto

~/.config/nvim/
├── init.lua
├── lua/
│   └── cf/
│       ├── lazy.lua
│       └── plugins/
│           ├── formatting.lua
│           ├── nvim-cmp.lua
│           └── lsp/
│               ├── lspconfig.lua
│               └── mason.lua


---

📦 Instalação

1. Clonar sua configuração

git clone https://github.com/<seu-usuario>/<seu-repo>.git ~/.config/nvim

2. Instalar o Lazy.nvim

git clone https://github.com/folke/lazy.nvim ~/.local/share/nvim/lazy/lazy.nvim

3. Sincronizar e instalar todos os plugins

nvim --headless "+Lazy! sync" +qa

4. Instalar dependências opcionais

Python (Black + Flake8)

python3 -m venv ~/.venvs/nvim
source ~/.venvs/nvim/bin/activate
pip install black flake8

Node.js (Prettier)

npm install -g prettier


---

⚙️ Principais componentes

🧠 LSP (Linguagens)

Gerenciado via Mason e Mason-LSPConfig:

ts_ls → TypeScript / JavaScript

html → HTML

cssls → CSS

jsonls → JSON

pyright → Python

lua_ls → Lua


🪄 Formatação automática

Fornecida por None-ls (ex-null-ls):

Prettier → JS / TS / JSON / HTML / CSS

Black → Python

Flake8 → Python (diagnósticos)


> Ao salvar (:w), o arquivo é automaticamente formatado pelo LSP.



🤖 Autocompletar

Gerenciado por nvim-cmp e LuaSnip:

Sugestões inteligentes

Navegação com Ctrl + n / Ctrl + p

Confirmação com Enter



---

⌨️ Atalhos úteis

Atalho	Função

gd	Ir para definição
gr	Mostrar referências
K	Exibir documentação do símbolo
<leader>f	Formatador manual
<leader>e	Mostrar diagnósticos (erros)
<leader>q	Fechar janela de diagnósticos
<C-n> / <C-p>	Navegar entre sugestões do autocompletar
<C-Space>	Forçar autocompletar
<CR>	Confirmar sugestão selecionada


> O <leader> normalmente é a tecla \, mas pode ser alterado em init.lua.




---

🧩 Plugins principais incluídos

Plugin	Função

williamboman/mason.nvim	Gerenciador de LSPs e ferramentas
williamboman/mason-lspconfig.nvim	Integração Mason + LSP
neovim/nvim-lspconfig	Configuração base dos servidores LSP
nvimtools/none-ls.nvim	Integração para formatadores e linters
hrsh7th/nvim-cmp	Autocompletar
L3MON4D3/LuaSnip	Snippets
hrsh7th/cmp-nvim-lsp	LSP + autocompletar



---

🧹 Manutenção

Atualizar todos os plugins

:Lazy update

Reinstalar servidores LSP

:Mason

Selecione o servidor e pressione i para instalar.

Diagnóstico geral

:checkhealth


---

🧾 Troubleshooting

Problema	Solução

“Expected a table of specs, but nil returned”	Arquivo Lua não retorna return { ... }
“tsserver is deprecated”	Use ts_ls no lugar de tsserver
“null-ls: attempt to index field ...”	Atualize para nvimtools/none-ls.nvim
“vim.tbl_flatten is deprecated”	Atualize Neovim para 0.11+
“require('lspconfig') deprecated”	Usa-se vim.lsp.configs agora



---

💡 Dica extra

Para um ambiente Python isolado com formatação e lint automáticos:

python3 -m venv ~/.venvs/nvim
source ~/.venvs/nvim/bin/activate
pip install black flake8

Depois, em ~/.bashrc, adicione:

alias nvim='source ~/.venvs/nvim/bin/activate && nvim'


---

🏁 Conclusão

Com essa configuração, seu Neovim está pronto para:

✅ Desenvolvimento moderno (JS, TS, Python, HTML, CSS, Lua)
✅ LSP + Autocompletar + Diagnóstico + Formatação automática
✅ Compatibilidade total com Neovim 0.11+


---

📚 Referências

Neovim Docs

Lazy.nvim

nvim-lspconfig

Mason.nvim

None-ls (null-ls)

nvim-cmp


---

