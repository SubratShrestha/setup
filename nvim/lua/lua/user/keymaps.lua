local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

---------------------- Normal -------------------------
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<C-n>", ":NvimTreeToggle<CR>", opts)

-- Resize with arrows
keymap("n", "<A-Up>", ":resize +2<CR>", opts)
keymap("n", "<A-Down>", ":resize -2<CR>", opts)
keymap("n", "<A-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<A-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<C-Right>", ":BufferNext<CR>", opts)
keymap("n", "<C-Left>", ":BufferPrev<CR>", opts)
keymap("n", "<C-w>", ":BufferClose<CR>", opts)

-- Ctrl-s to save
keymap("n", "<C-s>", ":w<CR>", opts)

-- Ctrl-s to save
keymap("n", "<C-q>", ":q<CR>", opts)

-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap(
	"n",
	"<leader>f",
	"<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
	opts
)
keymap("n", "<leader>F", "<cmd>Telescope live_grep<cr>", opts)

-- <leader> t to toggle terminal, mapping in toggleTerm.lua causes issues with
-- leader in insert mode, even when mapped to <Nop>
keymap("n", "<leader>t", ":ToggleTerm<CR>", opts)
keymap("n", "<leader>T", ":vsp | term<CR>", opts)

-- <leader>lf to format using null-ls
keymap("n", "<leader>lf", ":Format<CR>", opts)

-- Git stuff
keymap("n", "<leader>gg", ":Git<CR>", opts)
keymap("n", "<leader>gc", ":Git commit<CR>", opts)
keymap("n", "<leader>gp", ":Git push<CR>", opts)

---------------------- Visual -------------------------
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
