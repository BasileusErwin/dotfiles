return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-web-devicons', 'arkav/lualine-lsp-progress' },
  opts = require('config.lualine').setup
}
