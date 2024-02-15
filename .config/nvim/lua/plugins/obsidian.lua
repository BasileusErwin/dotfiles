return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = false,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "personal",
				path = "~/vaults/personal",
			},
			{
				name = "work",
				path = "~/vaults/work",
			},
		},
	},
	config = function(_, opts)
		vim.opt_local.conceallevel = 1

		local obsidian = require("obsidian")

		obsidian.setup(opts)
	end,
}
