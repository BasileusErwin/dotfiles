return {
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
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			style = vim.g.config.theme.style,
			terminal_colors = true,
			styles = {
				comments = { italic = true },
				keywords = { italic = true },
				functions = { bold = true },
				variables = { bold = true },
				sidebars = "dark",
				floats = "dark",
			},
		},
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
		"navarasu/onedark.nvim",
		priority = 1000,
		opts = {
			style = vim.g.config.theme.style,
			transparent = vim.g.config.theme.transparent,
			code_style = {
				comments = "italic",
				keywords = "bold",
				functions = "bold",
				strings = "italic",
				variables = "none",
			},
			lualine = {
				transparent = vim.g.config.theme.lualine.transparent,
			},
			diagnostics = {
				darker = true, -- darker colors for diagnostic
				undercurl = true, -- use undercurl instead of underline for diagnostics
				background = true, -- use background color for virtual text
			},
		},
	},
	{
		"marko-cerovac/material.nvim",
		priority = 1000,
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
					keywords = { italic = true },
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
