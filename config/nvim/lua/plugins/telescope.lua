local spec = {
	dir = "~/yunusey/.dotfiles/config/nvim/lua/yunusey/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
	},
}

function spec.config()
	local fb_actions = require "telescope".extensions.file_browser.actions
	require('telescope').setup({
	    defaults = {
	        prompt_prefix = '🔭: ',
	        mappings = {
	            i = {
	                ['<C-u>'] = false,
	                ['<C-d>'] = false,
	                ['<C-h>'] = "which_key",
	                ['<C-j>'] = require('telescope.actions').move_selection_next,
	                ['<C-k>'] = require('telescope.actions').move_selection_previous,
	                ['<C-n>'] = require('telescope.actions').move_selection_next,
	                ['<C-p>'] = require('telescope.actions').move_selection_previous,
	            },
	        },
	        layout_strategy = "vertical",
	        layout_config = {
	            horizontal = {
	                width = 0.90,
	                preview_width = 0.6
	            },
	            vertical   = {
	                width = 0.90,
	                preview_height = 0.6
	            },
	            preview_cutoff = 10,
	        },
	        previewer = true,
	    },

	    pickers = {
	        grep_string = { previewer = true },
	    },

	    extensions = {
	        file_browser = {
	            prompt_prefix = '🔭: ',
	            theme = 'dropdown',
	            hijack_netrw = true,
	            mappings = {
	                ["i"] = {
	                    ['<C-j>'] = require('telescope.actions').move_selection_next,
	                    ['<C-k>'] = require('telescope.actions').move_selection_previous,
	                    ['<C-n>'] = require('telescope.actions').move_selection_next,
	                    ['<C-p>'] = require('telescope.actions').move_selection_previous,
	                    ['~']     = fb_actions.goto_home_dir,
	                },
	                ["n"] = {
	                    ['<C-j>'] = require('telescope.actions').move_selection_next,
	                    ['<C-k>'] = require('telescope.actions').move_selection_previous,
	                    ['<C-n>'] = require('telescope.actions').move_selection_next,
	                    ['<C-p>'] = require('telescope.actions').move_selection_previous,
	                    ['~']     = fb_actions.goto_home_dir,
	                    ['u']     = fb_actions.goto_parent_dir,
	                },
	            },
	        },
	        bookmarks = {
	            -- theme = 'dropdown'
	        }
	    },
	})
	-- Enable telescope fzf native, if installed
	pcall(require('telescope').load_extension, 'fzf')
	-- Enable telescope-browser
 	require("telescope").load_extension "file_browser"
	-- Enable telescope-bookmarks
	require("telescope").load_extension "bookmarks"
	-- See `:help telescope.builtin`
	vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
	vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
	vim.keymap.set('n', '<leader>/', function()
	    -- You can pass additional configuration to telescope to change theme, layout, etc.
	    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
	        winblend = 10,
	        previewer = false,
	    })
	end, { desc = '[/] Fuzzily search in current buffer]' })
	
	vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
	vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
	vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
	vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
	vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
	
end

return spec
