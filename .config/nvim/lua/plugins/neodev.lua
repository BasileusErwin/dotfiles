return {
  "folke/neodev.nvim",
  lazy = "VeryLazy",
  opts = {
    library = {
      enabled = false, -- when not enabled, neodev will not change any settings to the LSP server
    },
    lspconfig = true,
    pathStrict = true,
  }
}
