return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-web-devicons' },
  event = "VeryLazy",
  opts = require('config.lualine').setup
}
