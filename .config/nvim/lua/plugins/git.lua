return {
	{
		"chrisgrieser/nvim-tinygit",
    enabled = false,
		ft = { "git_rebase", "gitcommit" },
		dependencies = {
			"stevearc/dressing.nvim",
			"nvim-telescope/telescope.nvim",
			"rcarriga/nvim-notify",
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			trouble = true,
		},
	},
}
