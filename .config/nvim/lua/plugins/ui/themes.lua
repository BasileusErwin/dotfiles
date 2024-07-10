return {
	{
		"rebelot/kanagawa.nvim",
		otps = {
			compile = true,
			undercurl = true,
			commentStyle = { italic = true },
			functionStyle = {
				italic = true,
				bold = true,
			},
			keywordStyle = { italic = true },
			statementStyle = {
				bold = true,
			},
			typeStyle = {
				italic = true,
				bold = true,
			},
			transparent = vim.g.config.theme.transparent,
			theme = vim.g.config.theme.style,
		},
	},
	{
		"gbprod/nord.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("nord").setup({
				styles = {
					comments = { italic = true },
					keywords = { bold = true },
					functions = { bold = true },
					variables = { bold = true },

					bufferline = {
						current = { bold = true },
						modified = { italic = true },
					},
				},
			})
		end,
	},
	{
		"neanias/everforest-nvim",
		version = false,
		lazy = false,
		priority = 1000,
		config = function()
			require("everforest").setup({
				background = vim.g.config.theme.style,
				italics = true,
			})
		end,
	},
	{
		"Shatur/neovim-ayu",
		priority = 1000,
		name = "ayu",
		config = function()
			require("ayu").setup({
				mirage = vim.g.config.theme.style == "mirage",
			})
		end,
	},
	{
		"tiagovla/tokyodark.nvim",
		priority = 1000,
		config = function()
			require("tokyodark").setup({
				transparent_background = vim.g.config.theme.transparent,
				gamma = 1.00,
				styles = {
					comments = { italic = true },
					keywords = { italic = true, bold = true },
					identifiers = { italic = true },
					functions = { bold = true, italic = true },
					variables = { bold = true },
				},
			})
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = true,
		opts = {
			terminal_colors = true, -- add neovim terminal colors
			undercurl = true,
			underline = true,
			bold = true,
			italic = {
				strings = true,
				emphasis = true,
				comments = true,
				operators = false,
				folds = true,
			},
			strikethrough = true,
			invert_selection = false,
			invert_signs = false,
			invert_tabline = false,
			invert_intend_guides = false,
			inverse = true, -- invert background for search, diffs, statuslines and errors
			contrast = "", -- can be "hard", "soft" or empty string
			palette_overrides = {},
			overrides = {},
			dim_inactive = false,
			transparent_mode = false,
		},
	},
}
