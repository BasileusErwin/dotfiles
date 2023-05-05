return {
  'kyazdani42/nvim-tree.lua',
  dependencies = {
    'kyazdani42/nvim-web-devicons',
    lazy = true,
    opts = { default = true }
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
