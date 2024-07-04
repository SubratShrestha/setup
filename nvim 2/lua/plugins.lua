local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local treesitter = require('treesitter')
local whichkey = require('whichkey')
local lsp = require('lsp')
local autocompletion = require("autocompletion")
local tabs = require('tabs')

require("lazy").setup({
    treesitter,
    whichkey,
    lsp,
    autocompletion,
    tabs,
    { -- Theme
        "catppuccin/nvim",
        priority = 1000,
        init = function()
            vim.cmd.colorscheme 'catppuccin-mocha'
            -- You can configure highlights by doing something like:
            vim.cmd.hi 'Comment gui=none'
        end,
    },
    { -- nvim tree
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup({
                update_focused_file = {
                    enable = true,
                }
            })
        end,
    },
    { -- Telescope: find stuff
        'nvim-telescope/telescope.nvim',
        tag = '0.1.6',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('telescope').setup({
                defaults = {
                    file_ignore_patterns = { '^node_modules/', '.*%.lock', '.*%-lock.json'},
                    mappings = {
                        i = {
                            ['<C-s>'] = 'select_vertical',
                        }
                    }
                }
            })
        end
    },
    { -- Autoformat
        'stevearc/conform.nvim',
        lazy = false,
        keys = {
            {
                '<leader>l',
                function()
                    require('conform').format { async = true, lsp_fallback = true }
                end,
                mode = '',
                desc = '[F]ormat buffer',
            },
        },
    },
    { -- Favorite files
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local harpoon = require('harpoon')
            local wk = require('which-key')

            wk.register({
                ['<leader>a'] = { function() harpoon:list():add() end, "Add to Harpoon" },
                ['<leader>h'] = { function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, "View Harpoon list" }
            })
        end
    },
    { -- Git gutter
        'lewis6991/gitsigns.nvim',
        config =
            function()
                require('gitsigns').setup()
            end
    }
})
