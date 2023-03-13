local spec = {
	"cpea2506/one_monokai.nvim",
}

function spec.config()
	require("one_monokai").setup {
		transparent = true,
		colors = {
			brown = '#504945',
			white = '#f8f8f0',
			grey = '#8F908A',
			black = '#000000',
			pink = '#f92672',
			green = '#a6e22e',
			aqua = '#66d9ef',
			yellow = '#e6db74',
			orange = '#fd971f',
			purple = '#ae81ff',
			red = '#e95678',

		},
		themes = function(colors)
			return {
				Include = { fg = colors.aqua, italic = true },
				["@kojl.boldtext"] = { fg = colors.orange, bold = true },
				["@kojl.underlinedtext"] = { fg = colors.purple, underline = true },
			}
		end,
	}

end

return spec
