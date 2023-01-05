local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

-- jk to switch to normal mode.
keymap("i", "jk", "<ESC>", default_opts)
keymap("t", "jk", "<C-\\><C-n>", default_opts)

-- Ctrl+a and Ctrl+z config
keymap("n", "<C-a>", "ggvG", default_opts)
keymap("i", "<C-z>", "<ESC>ui", default_opts)

-- Resizing Panes
keymap("n", "<Left>", ":vertical resize +1<CR>", default_opts)
keymap("n", "<Right>", ":vertical resize -1<CR>", default_opts)
keymap("n", "<Up>", ":resize -1<CR>", default_opts)
keymap("n", "<Down>", ":resize +1<CR>", default_opts)

-- <leader>q for Quit
-- <leader>w for Save and Quit
keymap("n", "<leader>q", ":bd!\n", default_opts)
keymap("n", "<leader>w", ":w\n:bd\n", default_opts)
