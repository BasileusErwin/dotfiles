return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  event = { "BufReadPost", "BufNewFile" },
  config = require('config.treesitter').setup,
}
