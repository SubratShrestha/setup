-- Leader must be set before any mappings are defined
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable netrw so nvim-tree can take over directory browsing
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true
vim.opt.number = true

-- Plugins (managed by the built-in vim.pack)
vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-telescope/telescope.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/nvim-tree/nvim-tree.lua",
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
  "https://github.com/sphamba/smear-cursor.nvim",
  "https://github.com/neovim/nvim-lspconfig",
  { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.*") },
  "https://github.com/yorumicolors/yorumi.nvim",
})

vim.cmd.colorscheme("yorumi")

-- Treesitter syntax highlighting (parsers are compiled once, then skipped)
require("nvim-treesitter").install({ "go", "bash", "javascript", "typescript", "tsx", "python", "json" })
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "go", "sh", "bash", "javascript", "javascriptreact", "typescript", "typescriptreact", "python", "json" },
  callback = function() pcall(vim.treesitter.start) end,
})

-- Autocompletion (sources: LSP, file paths, snippets, buffer words)
require("blink.cmp").setup({
  keymap = { preset = "enter" },
  completion = { documentation = { auto_show = true } },
})

-- Language servers (configs from nvim-lspconfig, binaries installed via Homebrew)
-- tsc is TypeScript 7's native compiler, which has a built-in language server (`tsc --lsp`)
vim.lsp.enable({ "gopls", "bashls", "tsc", "pyright", "jsonls" })

require("smear_cursor").setup({})
require("telescope").setup({})
require("nvim-tree").setup({
  view = { side = "left" },
  on_attach = function(bufnr)
    local api = require("nvim-tree.api")
    api.config.mappings.default_on_attach(bufnr)

    local opts = function(desc)
      return { buffer = bufnr, noremap = true, silent = true, nowait = true, desc = "nvim-tree: " .. desc }
    end
    vim.keymap.set("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
    vim.keymap.set("n", "h", api.node.open.horizontal, opts("Open: Horizontal Split"))
    -- Free up <C-k> (default: info popup) for window navigation
    vim.keymap.del("n", "<C-k>", { buffer = bufnr })
  end,
})

-- Keymaps
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>f", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>F", builtin.live_grep, { desc = "Search file contents" })
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle file explorer" })

-- Move between windows (splits and nvim-tree)
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
