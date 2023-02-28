P = function(args)
    print(vim.inspect(args))
end
N = require("notify")

local default_opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- jk to switch to normal mode.
keymap("i", "jk", "<ESC>",       default_opts)
keymap("t", "jk", "<C-\\><C-n>", default_opts)

-- Ctrl+a and Ctrl+z config
keymap("n", "<C-a>", "ggVG", default_opts)

-- Resizing Panes
keymap("n", "<A->>",  ":vertical resize +1<CR>",    default_opts)
keymap("n", "<A-<>",  ":vertical resize -1<CR>",    default_opts)
keymap("n", "<A-=>",  ":resize +1<CR>",             default_opts)
keymap("n", "<A-->",  ":resize -1<CR>",             default_opts)

-- Moving lines
keymap('i', "<A-j>", "<Esc>:m .+1<CR>==gi", default_opts)
keymap('i', "<A-k>", "<Esc>:m .-2<CR>==gi", default_opts)
keymap('n', "<A-j>", ":m .+1<CR>",          default_opts)
keymap('n', "<A-k>", ":m .-2<CR>",          default_opts)

-- <leader>q for Quit
-- <leader>w for Save and Quit
keymap("n", "<leader>q", ":bdelete!<CR>", {silent = true, desc = "[Q]uit Buffer"})
keymap("n", "<leader>w", ":w<CR>:BufferClose<CR>", default_opts)

-- Putting new lines without leaving the normal mode.
keymap('n', '<leader>o', "o<Esc>", {silent = true})
keymap('n', '<leader>O', "O<Esc>", {silent = true})

-- Commandline <leader><leader> opens commandline buffer.
keymap('c', '<leader><leader>', "<C-f>", {silent = true})

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
    vim.cmd("te")
    vim.cmd("lua vim.wo.relativenumber = false")
    vim.cmd("lua vim.wo.number = false")
    notify("Opening Wide Terminal")
end

vim.api.nvim_create_user_command("OpenInExplorer",   openDirInExplorer, {})
vim.api.nvim_create_user_command("OpenInNotepad",    openFileInNotepad, {})
vim.api.nvim_create_user_command("OpenWideTerminal", openWideTerminal,  {})

