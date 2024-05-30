return {
  'numToStr/Comment.nvim',
  event = 'InsertEnter',
  keys = { 'gc', 'gcc', 'gbc' },
  opts = {},
  config = function(_, opts)
    require('Comment').setup(opts)

    local ft = require('Comment.ft')

    ft({ 'ignis' }, ft.get('c'))
  end
}
