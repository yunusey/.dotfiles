local spec = {
	'nvim-lualine/lualine.nvim',
}

function spec.config()
	local function navic()
	    local available = require('nvim-navic').is_available()
	    if available then
	        return require('nvim-navic').get_location()
	    else
	        return ""
	    end
	end
	require('lualine').setup {
		options = {
			icons_enabled = true,
			theme = 'molokai',
			component_separators = '|',
			section_separators = { left = '', right = '' },
		},
		sections = {
			lualine_a = {
				{ 'mode', separator = { left = '' }, right_padding = 2 },
			},
			lualine_b = {{'branch', icon = ''}, {'diff'}, {'diagnostics'}},
			lualine_c = {'filename', {navic, color={fg="#ffaa00"}}},
			lualine_x = {'filetype'},
			lualine_y = {'progress'},
			lualine_z = {
				{ 'location', separator = { right = '' }, left_padding = 2 },
			},
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},
	}

end

return spec
