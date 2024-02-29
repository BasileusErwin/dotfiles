return {
	{
		"nvim-orgmode/orgmode",
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter", lazy = true },
			{
				"nvim-orgmode/org-bullets.nvim",
				config = function()
					require("org-bullets").setup()
				end,
			},
		},
		event = "BufRead *.org",
		config = function()
			require("orgmode").setup_ts_grammar()

			require("orgmode").setup({
				org_agenda_files = "~/.notes/**/*",
				org_default_notes_file = "~/.notes/refile.org",
			})
		end,
	},
}
