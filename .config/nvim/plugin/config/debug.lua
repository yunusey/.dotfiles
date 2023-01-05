vim.keymap.set('n', "<leader>b", ":DapToggleBreakpoint<CR>", {silent = false})
vim.keymap.set('n', "<F5>", ":DapContinue<CR>", {silent = false})
vim.keymap.set('n', "<leader>t", ":DapToggleRepl<CR>", {silent = false})

local clipboard_debug = ""

function DebugLine ()
	local line = vim.api.nvim_win_get_cursor(0)[1]
	local filename = vim.fn.expand("%")
	print(Clip(filename, line))
end

function Clip (filename, line) 
	clipboard_debug = filename .. " " .. line
	return clipboard_debug
end

function Write () 
	local line = vim.api.nvim_get_current_line() .. clipboard_debug
	vim.api.nvim_set_current_line(line)
end

vim.keymap.set('n', '<leader>KK', DebugLine, {silent = true})
vim.keymap.set('n', '<leader>vK', Write, {silent = true})

