return {
	{ "EdenEast/nightfox.nvim" },
	{ "frenzyexists/aquarium-vim" },
	{ "sainnhe/everforest" },
	{
		"navarasu/onedark.nvim",
		lazy = true,
		event = "VeryLazy",
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
		lazy = true,
		event = "VeryLazy",
	},
	{
		"tomasiser/vim-code-dark",
		lazy = true,
		event = "VeryLazy",
	},
	{
		"tanvirtin/monokai.nvim",
		lazy = true,
		event = "VeryLazy",
	},
	{
		"Shatur/neovim-ayu",
		lazy = true,
		event = "VeryLazy",
		name = "ayu",
		config = function()
			require("ayu").setup({
				mirage = vim.g.config.theme.style == "mirage",
			})
		end,
	},
	{
		"ghifarit53/tokyonight-vim",
		lazy = true,
		event = "VeryLazy",
	},
	{
		"tiagovla/tokyodark.nvim",
		lazy = true,
		event = "VeryLazy",
	},
	{
		"loctvl842/monokai-pro.nvim",
		lazy = true,
		event = "VeryLazy",
		config = function()
			require("monokai-pro").setup({
				transparent_background = vim.g.config.theme.transparent,
				filter = vim.g.config.theme.style,
				devicons = false,
				styles = {
					comment = { italic = true },
					keyword = { bold = true, italic = true },
					type = { bold = true }, -- (preferred) int, long, char, etc
					storageclass = { italic = true }, -- static, register, volatile, etc
					structure = { bold = true, italic = true }, -- struct, union, enum, etc
					parameter = { italic = true }, -- parameter pass in function
					annotation = { italic = true },
					tag_attribute = { italic = true }, -- attribute of tag in reactjs
				},
			})
		end,
	},
	{
		"AlexvZyl/nordic.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("nordic").load()
		end,
	},
	{
		"projekt0n/github-nvim-theme",
		lazy = true,
		event = "VeryLazy",
	},
	{
		"JoosepAlviste/palenightfall.nvim",
		lazy = true,
		event = "VeryLazy",
	},
	{
		"VDuchauffour/neodark.nvim",
		lazy = true,
		event = "VeryLazy",
	},
	{
		"uloco/bluloco.nvim",
		lazy = false,
		priority = 1000,
		dependencies = { "rktjmp/lush.nvim" },
		opts = {
			style = "dark",
			transparent = true,
			italics = true,
			terminal = vim.fn.has("gui_running") == 1, -- bluoco colors are enabled in gui terminals per default.
			guicursor = true,
		},
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
    }
  },
}
