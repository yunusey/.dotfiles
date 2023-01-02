local function open_initfile()
	vim.cmd(":tabnew ~/.config/nvim/init.lua")
end

vim.api.nvim_create_user_command("OpenInit", function()
	open_initfile()
end, {})
