local spec = {
	"navarasu/onedark.nvim"
}

function spec.config()
	require("onedark").setup {
		transparent = true,
	}

end

return spec
