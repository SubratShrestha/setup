-- Leader must be set before any mappings are defined
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable netrw so nvim-tree can take over directory browsing
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true
vim.opt.number = true
-- Use the system clipboard for yank/paste (macOS uses pbcopy/pbpaste)
vim.opt.clipboard = "unnamedplus"

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
  "https://github.com/windwp/nvim-autopairs",
  "https://github.com/folke/which-key.nvim",
})

vim.cmd.colorscheme("yorumi")
-- Yorumi's colors are dim next to the terminal's: brighten every text color by 25%, keeping its hue
for group, hl in pairs(vim.api.nvim_get_hl(0, {})) do
  if hl.fg then
    local r, g, b = math.floor(hl.fg / 65536), math.floor(hl.fg / 256) % 256, hl.fg % 256
    hl.fg = string.format("#%02x%02x%02x", math.min(255, r * 1.25), math.min(255, g * 1.25), math.min(255, b * 1.25))
    vim.api.nvim_set_hl(0, group, hl)
  end
end
-- and use Ghostty's default white for plain text
for _, group in ipairs({ "Normal", "NormalFloat", "@variable" }) do
  vim.api.nvim_set_hl(0, group, vim.tbl_extend("force", vim.api.nvim_get_hl(0, { name = group }), { fg = "#ffffff" }))
end

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
  signature = { enabled = true },
})

-- Language servers (configs from nvim-lspconfig, binaries installed via Homebrew)
-- tsc is TypeScript 7's native compiler, which has a built-in language server (`tsc --lsp`)
vim.lsp.enable({ "gopls", "bashls", "tsc", "pyright", "ruff", "jsonls", "postgres_lsp" })

-- Format on save with the language server, when it supports formatting
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function(args)
    if #vim.lsp.get_clients({ bufnr = args.buf, method = "textDocument/formatting" }) > 0 then
      vim.lsp.buf.format({ bufnr = args.buf })
    end
  end,
})

require("smear_cursor").setup({})
-- Auto-close brackets and quotes
require("nvim-autopairs").setup({})
require("telescope").setup({})
-- Shows available keybindings in a popup after pressing a prefix like <leader>
require("which-key").setup({
  spec = { { "<leader>g", group = "Go to" } },
})
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
vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, { desc = "Hover docs" })
vim.keymap.set("n", "<leader>d", function() vim.diagnostic.open_float({ source = true }) end, { desc = "Show diagnostic" })
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { desc = "Rename symbol" })
vim.keymap.set("n", "<leader>gd", builtin.lsp_definitions, { desc = "Go to definition" })
vim.keymap.set("n", "<leader>gr", builtin.lsp_references, { desc = "Go to references" })
vim.keymap.set("n", "<leader>gi", builtin.lsp_implementations, { desc = "Go to implementation" })
vim.keymap.set("n", "<leader>[", "<C-o>", { desc = "Go back" })
vim.keymap.set("n", "<leader>]", "<C-i>", { desc = "Go forward" })

-- Move between windows (splits and nvim-tree)
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
