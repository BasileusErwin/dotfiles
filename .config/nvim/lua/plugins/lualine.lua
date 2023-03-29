return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-web-devicons', 'arkav/lualine-lsp-progress' },
  event = "VeryLazy",
  opts = require('config.lualine').setup
}
