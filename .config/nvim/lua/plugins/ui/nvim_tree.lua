return {
  'kyazdani42/nvim-tree.lua',
  enabled = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },
  name = 'nvim-tree',
  module = true,
  keys = {
    { '<Space>e', '<cmd>NvimTreeToggle<CR>' },
  },
  cmd = { 'NvimTreeToggle' },
  event = { "VeryLazy", "VimEnter" },
  opts = require('config.nvim_tree').setup,
}
