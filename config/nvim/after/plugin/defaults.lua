local api = vim.api
local g = vim.g
local opt = vim.o

-- Remap leader and local leader to <Space>
api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
g.mapleader = " "
g.maplocalleader = " "

opt.termguicolors = true -- Enable colors in terminal
opt.hlsearch = true --Set highlight on search
opt.number = true --Make line numbers default
opt.relativenumber = true --Make relative number default
opt.mouse = "a" --Enable mouse mode
opt.breakindent = true --Enable break indent
opt.undofile = true --Save undo history
opt.ignorecase = true --Case insensitive searching unless /C or capital in search
opt.smartcase = true -- Smart case
opt.updatetime = 250 --Decrease update time
opt.signcolumn = "yes" -- Always show sign column
opt.clipboard = "" -- Do not access system clipboard
opt.timeoutlen = 300	--	Time in milliseconds to wait for a mapped sequence to complete.
opt.tabstop = 4 -- Set tab-indent to 4
opt.shiftwidth = opt.tabstop -- Set tab-indent to 4
vim.o.swapfile = false -- Don't use swp files
vim.o.backup = false -- Don't use backup
vim.o.writebackup = false -- Don't write backup
vim.o.undofile = true -- Save undo history

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set scrolloff
vim.o.scrolloff = 8

vim.cmd[[hi NvimTreeNormal guibg=NONE ctermbg=NONE]]

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Highlight on yank
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

-- Select colorscheme
-- vim.cmd [[colorscheme monokai]]
