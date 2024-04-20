return {
	"folke/neodev.nvim",
	event = "VeryLazy",
	lazy = true,
	opts = {
		library = {
			enabled = true,
			plugins = { "nvim-dap-ui" },
			types = true,
		},
		lspconfig = true,
		pathStrict = true,
	},
}
