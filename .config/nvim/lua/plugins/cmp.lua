return {
  'hrsh7th/cmp-nvim-lsp',
  event = 'BufEnter',
  dependencies = {
    'hrsh7th/cmp-buffer',
    'onsails/lspkind-nvim',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
    'saadparwaiz1/cmp_luasnip',
    'L3MON4D3/LuaSnip',
    'rafamadriz/friendly-snippets',
    {
      'tzachar/cmp-tabnine',
      build = './install.sh',
      opts = {
        max_lines = 1000,
        max_num_results = 20,
        sort = true,
        run_on_every_keystroke = true,
        snippet_placeholder = '..',
      },
      config = function(_, opts)
        local tabnine = require('cmp_tabnine.config')
        tabnine:setup(opts)
      end
    },
  },
  config = require('config.cmp').setup
}
