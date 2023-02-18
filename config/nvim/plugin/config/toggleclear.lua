TOGGLE_VAL = true

local function clearEnvironment ()
	if TOGGLE_VAL then
		vim.cmd("Gitsigns detach")
		vim.wo.relativenumber = false
		vim.wo.number = false
		vim.wo.signcolumn = "no"
	else
		vim.cmd("Gitsigns attach")
		vim.wo.relativenumber = true
		vim.wo.number = true
		vim.wo.signcolumn = "yes"
	end
	TOGGLE_VAL = not TOGGLE_VAL
end

vim.api.nvim_create_user_command("ClearEnv", clearEnvironment, {})
