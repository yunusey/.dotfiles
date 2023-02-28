-- Tokyonight setup
-- require("tokyonight").setup({
--     style = "moon",
--     light_style = "day",
--     transparent = true,
--     terminal_colors = true,
--     styles = {
--         comments = { italic = true },
--         keywords = { italic = true },
--         functions = {},
--         variables = {},
--         sidebars = "dark",
--         floats = "dark",
--     },
--     sidebars = { "qf", "help" },
--     day_brightness = 0.3,
--     hide_inactive_statusline = false,
--     dim_inactive = false,
--     lualine_bold = false,
--
--     on_colors = function(colors)
--
--     end,
--
--     on_highlights = function(highlights, colors)
--         highlights.TelescopePromptPrefix = {
--             fg = "#00ff00",
--         }
--     end,
-- })

-- Onedark setup
require("onedark").setup {
    transparent = true,
}

-- OneMonokai setup
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

-- Set ColorScheme
vim.cmd [[colorscheme one_monokai]]
-- vim.cmd [[colorscheme tokyonight]]
-- vim.cmd [[colorscheme onedark]]
