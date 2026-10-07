# nvim3

A Neovim config in a single `init.lua`. Plugins are managed by Neovim's built-in `vim.pack`. They install on first launch and their versions are pinned in `nvim-pack-lock.json`.

## Setup

```sh
xcode-select --install   # C compiler, needed to build Treesitter parsers
brew bundle              # installs everything in the Brewfile
npm install -g @postgres-language-server/cli
ln -s "$PWD" ~/.config/nvim
```

Then open `nvim`. The first launch clones the plugins and compiles the Treesitter parsers.

## Required shell tools

All of these are in the `Brewfile`.

| Tool | Brew formula | Used for |
| --- | --- | --- |
| Neovim 0.12+ | `neovim` | The editor. Needs 0.12 or newer for `vim.pack` |
| git | `git` | `vim.pack` clones plugins with it |
| ripgrep | `ripgrep` | Telescope `live_grep` (`<leader>F`) and `find_files` (`<leader>f`) |
| tree-sitter CLI | `tree-sitter-cli` | nvim-treesitter (`main` branch) builds parsers with it. Also needs a C compiler (Xcode Command Line Tools) |
| gopls | `gopls` | Go language server |
| bash-language-server | `bash-language-server` | Bash / sh language server |
| tsc | `typescript` | TypeScript 7's native compiler, run as a JS/TS language server with `tsc --lsp` |
| pyright | `pyright` | Python language server |
| ruff | `ruff` | Python formatter and linter, run as a language server |
| shfmt | `shfmt` | Bash formatter, used by bash-language-server |
| vscode-json-language-server | `vscode-langservers-extracted` | JSON language server |

Not in the Brewfile:

| Tool | Install | Used for |
| --- | --- | --- |
| postgres-language-server | `npm install -g @postgres-language-server/cli` | SQL language server. The Homebrew build is broken: it misparses every statement |

`curl` and `tar` (included with macOS) are also used: blink.cmp downloads a prebuilt fuzzy-matcher binary with them.

## Keybindings

Leader is `Space`. Press it and wait to see these in the which-key popup.

| Key | Action |
| --- | --- |
| `<leader>f` | Find files |
| `<leader>F` | Search file contents |
| `<leader>e` | Toggle file explorer |
| `<leader>h` | Hover docs (signature, types) |
| `<leader>d` | Show diagnostic (full error message) |
| `<leader>r` | Rename symbol |
| `<leader>gd` | Go to definition |
| `<leader>gr` | Go to references |
| `<leader>gi` | Go to implementation |
| `<leader>[` | Go back (to where you were before a jump) |
| `<leader>]` | Go forward |
| `<C-h>` `<C-j>` `<C-k>` `<C-l>` | Move to the window left / below / above / right |

In the file explorer, `v` opens a file in a vertical split and `h` in a horizontal split.

In the completion menu (blink.cmp `enter` preset), `Enter` accepts, `Ctrl-n` / `Ctrl-p` move through items, `Ctrl-Space` opens the menu and `Ctrl-e` closes it.

Files are formatted on save by their language server.

## SQL

`postgres_lsp` only starts in projects that have a `postgres-language-server.jsonc` (create one with `postgres-language-server init`). Its `db` section sets which database completions come from. Completions work inside queries (`SELECT`, `UPDATE`, ...), not in `CREATE TABLE`.
