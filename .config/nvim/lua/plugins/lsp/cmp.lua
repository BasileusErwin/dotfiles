return {
  'hrsh7th/cmp-nvim-lsp',
  dependencies = {
    'hrsh7th/cmp-buffer',
    'onsails/lspkind-nvim',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    {
      'L3MON4D3/LuaSnip',
      version = "v2.1.1",
      enabled = true,
      build = "make install_jsregexp",
      dependencies = {
        'saadparwaiz1/cmp_luasnip',
        'rafamadriz/friendly-snippets',
      },
      config = function()
        require("config.snip").setup()
      end
    },
    'hrsh7th/cmp-vsnip',
    'David-Kunz/cmp-npm',
    'Saecki/crates.nvim',
  },
  config = require('config.cmp').setup
}
