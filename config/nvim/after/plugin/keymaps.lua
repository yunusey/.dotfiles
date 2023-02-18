local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

-- jk to switch to normal mode.
keymap("i", "jk", "<ESC>", default_opts)
keymap("t", "jk", "<C-\\><C-n>", default_opts)

-- Ctrl+a and Ctrl+z config
keymap("n", "<C-a>", "ggVG", default_opts)
keymap("i", "<C-z>", "<ESC>ui", default_opts)

-- Resizing Panes
keymap("n", "<Left>", ":vertical resize +1<CR>", default_opts)
keymap("n", "<Right>", ":vertical resize -1<CR>", default_opts)
keymap("n", "<Up>", ":resize -1<CR>", default_opts)
keymap("n", "<Down>", ":resize +1<CR>", default_opts)

-- <leader>q for Quit
-- <leader>w for Save and Quit
keymap("n", "<leader>q", ":bdelete!<CR>", {silent = true, desc = "[Q]uit Buffer"})
keymap("n", "<leader>w", ":w<CR>:BufferClose<CR>", default_opts)

-- Putting new lines without leaving the normal mode.
vim.keymap.set('n', '<leader>o', "o<Esc>", {silent = true})
vim.keymap.set('n', '<leader>O', "O<Esc>", {silent = true})

-- Commandline <leader><leader> opens commandline buffer.
vim.keymap.set('c', '<leader><leader>', "<C-f>", {silent = true})

-- -- Autocomplete {}, [], "", '', ()
-- Not using anymore...
-- keymap('i', '{', '{}', default_opts)
-- keymap('i', '(', '()<left>', default_opts)
-- keymap('i', '[', '[]<left>', default_opts)
-- keymap('i', '"', '""<left>', default_opts)
-- keymap('i', "'", "''<left>", default_opts)
--
local notify = require('notify')

local linux_path = "\\wsl.localhost\\Ubuntu-20.04"
local convertToWindowsPath = function (path)
    local a = string.gsub(path, "/", "\\")
    a = string.sub(a, 0, #a)
    return a
end

local function openDirInExplorer()
    local dir = vim.fn.expand("%:p:h")
    dir = linux_path .. convertToWindowsPath(dir)
    vim.fn.jobstart({"explorer.exe", '"' .. dir .. '"'})
    notify("Opening: " .. dir, "success", {
	-- render = 'minimal',
    })
end

local function openFileInNotepad()
    local file = vim.fn.expand("%:p")
    vim.fn.jobstart({"notepad.exe", file})
    print(file)
    notify("Opening: " .. file, "success", {
	-- render = 'minimal',
    })
end

local function openWideTerminal()
    vim.cmd(":te")
    vim.cmd(":set nonumber")
    vim.cmd(":set norelativenumber")
    notify("Opening Wide Terminal")
end

vim.api.nvim_create_user_command("OpenInExplorer", openDirInExplorer, {})
vim.api.nvim_create_user_command("OpenInNotepad", openFileInNotepad, {})
vim.api.nvim_create_user_command("OpenWideTerminal", openWideTerminal, {})

