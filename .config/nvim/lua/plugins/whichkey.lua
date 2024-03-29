return {
	"folke/which-key.nvim",
  lazy = false,
	event = { "VeryLazy", "VimEnter" },
	config = require("config.whichkey").setup,
	opts = {
		window = {
			border = "single", -- none, single, double, shadow
			position = "bottom", -- bottom, top
		},
	},
}
