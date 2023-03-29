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
    'ray-x/lsp_signature.nvim',
    {
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      event = 'VeryLazy',
    },
    'jose-elias-alvarez/null-ls.nvim',
    'b0o/schemastore.nvim',
    {
      "j-hui/fidget.nvim",
      enabled = false,
      opts = {
        text = {
          spinner = "dots"
        },
        window = {
          blend = 100,
          reative = "editor",
        },
        fmt = {
          leftpad = true,
          stack_upwards = true,
          max_width = 0,
          -- task = function () end,
        },
        sources = {
          ["null-ls"] = {
            ignore = true,
          },
          ['diagnostics'] = {
            ignore = true
          }
        },
      },
    }
  }
}
