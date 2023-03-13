local spec = {
	'rcarriga/nvim-notify'
}

function spec.config()
	vim.o.termguicolors = true
	require('notify').setup({
		background_colour = "#000001"
	})
end

return spec
