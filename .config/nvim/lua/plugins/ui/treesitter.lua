return {
  'nvim-treesitter/nvim-treesitter',
  enabled = true,
  build = ':TSUpdate',
  lazy = false,
  config = require('config.treesitter').setup,
}
