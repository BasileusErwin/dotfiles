return {
	{

		"epwalsh/obsidian.nvim",
		version = "*",
		lazy = true,
		ft = "markdown",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			ui = {
				enable = false,
			},
			workspaces = {
				{
					name = "personal",
					path = "~/.notes/personal",
				},
				{
					name = "work",
					path = "~/.notes/work",
				},
			},
		},
		config = function(_, opts)
			vim.opt_local.conceallevel = 1

			local obsidian = require("obsidian")

			obsidian.setup(opts)
		end,
	},
	{
		"ixru/nvim-markdown",
    lazy = true,
    ft = "markdown",
    event = "BufRead *.md",
	},
}
