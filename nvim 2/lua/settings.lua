-- set leader to <space>
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = false

-- most options kept in vim.opt
-- list with :help option-list or https://neovim.io/doc/user/options.html#option-summary
vim.opt.number = true
-- vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.opt.clipboard = 'unnamedplus'
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250 -- nothing typed in 250ms => write to disk
vim.opt.timeoutlen = 100 -- Displays which-key popup sooner
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.inccommand = 'split'
vim.opt.list = true -- Apply below for whitespace chars
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.hlsearch = true
vim.opt.termguicolors = true
vim.g.loaded_netrw = 1 -- disable netrw
vim.g.loaded_netrwPlugin = 1 -- disable netrw
vim.opt.expandtab = true -- use spaces
vim.opt.autoindent = true
vim.opt.tabstop = 4 -- when hitting tab
vim.opt.shiftwidth = 4 -- when doing >>
