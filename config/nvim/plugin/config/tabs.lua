local keymap = vim.keymap.set

local opts = {silent = true, noremap = true}

keymap({'n', 't'}, "<leader><Tab>",   ":tabnext<CR>",      opts)
keymap({'n', 't'}, "<leader><S-Tab>", ":tabprevious<CR>",  opts)
keymap({'n', 't'}, "<leader>tp",      ":BufferPin<CR>",    opts)
keymap({'n', 't'}, "<C-t>",           ":tabnew<CR>",       opts)
keymap({'n', 't'}, "<A-left>",        ":-tabmove<CR>",     opts)
keymap({'n', 't'}, "<A-right>",       ":+tabmove<CR>",     opts)

keymap('n', '<A-1>', '<Cmd>1tabnext<CR>', opts)
keymap('n', '<A-2>', '<Cmd>2tabnext<CR>', opts)
keymap('n', '<A-3>', '<Cmd>3tabnext<CR>', opts)
keymap('n', '<A-4>', '<Cmd>4tabnext<CR>', opts)
keymap('n', '<A-5>', '<Cmd>5tabnext<CR>', opts)
keymap('n', '<A-6>', '<Cmd>6tabnext<CR>', opts)
keymap('n', '<A-7>', '<Cmd>7tabnext<CR>', opts)
keymap('n', '<A-8>', '<Cmd>8tabnext<CR>', opts)
keymap('n', '<A-9>', '<Cmd>9tabnext<CR>', opts)
keymap('n', '<A-0>', '<Cmd>tablast<CR>',  opts)

keymap('n', '<leader>e', ":NvimTreeToggle<CR>", {silent = false})

-- Show tabline even if there's just one tab open
vim.cmd("set showtabline=4")

