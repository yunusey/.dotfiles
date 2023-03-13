local spec = {
	"nvim-tree/nvim-tree.lua",
}

function spec.config()
	local tree = require('nvim-tree')
	tree.setup({
		view = {
			mappings = {
				list = {
					{key = "u", action = "dir_up"}
				}
			}
		},
		filters = {
			dotfiles = false,
		},
	})
end

return spec
