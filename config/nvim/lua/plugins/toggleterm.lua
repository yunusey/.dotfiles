local spec = {
	"akinsho/toggleterm.nvim"
}

function spec.config()
	require('toggleterm').setup ({
		open_mapping = [[<c-\>]],
		shade_terminals = true,
		start_in_insert = true,
		direction = 'float',
		float_opts = {
			border = 'curved',
		},
		winbar = {
			enabled = false,
		},
	})

end

return spec
