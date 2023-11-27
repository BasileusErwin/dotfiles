return {
  'hrsh7th/cmp-nvim-lsp',
  event = 'BufEnter',
  dependencies = {
    'hrsh7th/cmp-buffer',
    'onsails/lspkind-nvim',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    {
      'L3MON4D3/LuaSnip',
      dependencies = {
        'saadparwaiz1/cmp_luasnip',
        'rafamadriz/friendly-snippets',
      },
      config = function()
        require("config.snip").setup()
      end
    },
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
    'David-Kunz/cmp-npm',
    'Saecki/crates.nvim',
  },
  config = require('config.cmp').setup
}
