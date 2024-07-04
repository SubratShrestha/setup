return {
    "folke/which-key.nvim",
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    config = function() -- This is the function that runs, AFTER loading
        require('which-key').setup()
        -- local harpoon = require('harpoon')
        -- harpoon:setup()

        -- Document existing key chains
        require('which-key').register {
            ['<leader>f'] = { '<cmd>Telescope find_files<cr>', 'Find files' },
            ['<leader>F'] = { '<cmd>Telescope live_grep<cr>', 'Find content' },
            ['<leader>r'] = { function() vim.lsp.buf.rename() end, "Rename Symbol" },
            ['<leader>e'] = { '<cmd>NvimTreeToggle<CR>', 'Toggle Explorer' },
            ['<leader>E'] = { function() require('telescope.builtin').diagnostics() end, 'Errors and Warnings' },
            ['<leader>g'] = {
                name = "+ Go To -> ",
                d = { function() require('telescope.builtin').lsp_definitions() end, 'Definition' },
                i = { function() require('telescope.builtin').lsp_implementations() end, 'Implementation' },
                r = { function() require('telescope.builtin').lsp_references() end, 'References' },
            },
            ['<leader>b'] = {
                name = "+ Buffer ->",
                w = { '<cmd>BufferLineCyclePrev<CR><cmd>BufferLineCloseRight<CR>', 'Close buffer' },
                W = { '<cmd>BufferLineCloseOthers<CR>', 'Close all other buffers'},
                f = { '<cmd>BufferLinePick<CR>', 'Find buffer' },
            }
        }

        -- visual mode
        require('which-key').register({
            ['<leader>h'] = { 'Git [H]unk' },
        }, { mode = 'v' })
    end,
}
