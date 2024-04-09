return {
	{
		"chrisgrieser/nvim-tinygit",
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
		config = function()
			local gitsigns = require("gitsigns")
			gitsigns.setup({
				trouble = true,
				on_attach = function(bufnr)
					vim.keymap.set("n", "<leader>hs", gitsigns.stage_hunk, { buffer = bufnr })
					vim.keymap.set("n", "<leader>hu", gitsigns.undo_stage_hunk, { buffer = bufnr })
					vim.keymap.set("n", "<leader>hr", gitsigns.reset_hunk, { buffer = bufnr })
					vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk, { buffer = bufnr })
					vim.keymap.set("n", "<leader>hj", gitsigns.next_hunk, { buffer = bufnr })
					vim.keymap.set("n", "<leader>hk", gitsigns.prev_hunk, { buffer = bufnr })
				end,
				signs = {
					add = {
						hl = "GitSignsAdd",
						text = vim.g.config.icons.git.added,
						numhl = "GitSignsAddNr",
						linehl = "GitSignsAddLn",
					},
					change = {
						hl = "GitSignsChange",
						text = vim.g.config.icons.git.modified,
						numhl = "GitSignsChangeNr",
						linehl = "GitSignsChangeLn",
					},
					delete = {
						hl = "GitSignsDelete",
						text = vim.g.config.icons.git.removed,
						numhl = "GitSignsDeleteNr",
						linehl = "GitSignsDeleteLn",
					},
					topdelete = {
						hl = "GitSignsDelete",
						text = vim.g.config.icons.git.removed,
						numhl = "GitSignsDeleteNr",
						linehl = "GitSignsDeleteLn",
					},
					changedelete = {
						hl = "GitSignsChange",
						text = vim.g.config.icons.git.removed,
						numhl = "GitSignsChangeNr",
						linehl = "GitSignsChangeLn",
					},
				},
			})
		end,
	},
}
