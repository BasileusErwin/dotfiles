return {
	"pmizio/typescript-tools.nvim",
	requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	event = {
		"BufRead *.ts",
		"BufRead *.tsx",
		"BufRead *.jsx",
		"BufRead *.js",
	},
	config = function()
		require("typescript-tools").setup({
			settings = {
				separate_diagnostic_server = false,
				publish_diagnostic_on = "change",
				tsserver_file_preferences = {
					includeInlayParameterNameHints = "all",
					quotePreference = "single",
					importModuleSpecifierEnding = "relative",
					includeCompletionsForImportStatements = true,
				},
				tsserver_format_options = {
					allowRenameOfImportPath = true,
				},
			},
		})
	end,
}
