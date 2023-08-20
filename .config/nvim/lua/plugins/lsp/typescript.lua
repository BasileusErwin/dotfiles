return {
  "pmizio/typescript-tools.nvim",
  requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  config = function()
    require("typescript-tools").setup({
      settings = {
        tsserver_file_preferences = {
          includeInlayParameterNameHints = "all",
          quotePreference = "single",
          importModuleSpecifierEnding = 'relative',
          includeCompletionsForImportStatements = true
        },
        tsserver_format_options = {
          allowRenameOfImportPath = true,
        }
      }
    })
  end,
}
