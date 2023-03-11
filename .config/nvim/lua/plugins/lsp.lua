return {
  'neovim/nvim-lspconfig',
  event = 'VeryLazy',
  config = function()
    require('config.lsp').setup()
  end,
  dependencies = {
    {
      'williamboman/mason.nvim',
      event = 'VeryLazy',
      opts = {
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      },
    },
    'williamboman/mason-lspconfig.nvim',
    {
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      event = 'VeryLazy',
    },
    'jose-elias-alvarez/null-ls.nvim',
    'b0o/schemastore.nvim',
    {
      "j-hui/fidget.nvim",
      opts = {
        window = {
          blend = 0,
        },
        sources = {
          ["null-ls"] = {
            ignore = true,
          },
        },
      },
    }
  }
}
