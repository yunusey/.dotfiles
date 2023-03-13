local spec = {
	'folke/tokyonight.nvim'
}

function spec.config()
	require("tokyonight").setup({
		style = "moon",
		light_style = "day",
		transparent = true,
		terminal_colors = true,
		styles = {
			comments = { italic = true },
			keywords = { italic = true },
			functions = {},
			variables = {},
			sidebars = "dark",
			floats = "dark",
		},
		sidebars = { "qf", "help" },
		day_brightness = 0.3,
		hide_inactive_statusline = false,
		dim_inactive = false,
		lualine_bold = false,

		on_colors = function(colors)

		end,

		on_highlights = function(highlights, colors)
			highlights.TelescopePromptPrefix = {
				fg = "#00ff00",
			}
		end,
	})
end

return spec
