return {
	{
		"scalameta/nvim-metals",
		dependencies = { "nvim-lua/plenary.nvim" },
		ft = { "scala" },
		event = "BufRead *.scala",
		config = function()
			vim.cmd([[autocmd FileType scala,sbt lua require("metals").initialize_or_attach({})]])
		end,
	},
	{
		"mfussenegger/nvim-jdtls",
    dependencies = {
      "mfussenegger/nvim-dap"
    },
		config = function()
		end,
	},
}
