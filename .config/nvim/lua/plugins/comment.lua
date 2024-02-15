return {
  'numToStr/Comment.nvim',
  event = 'InsertEnter',
  keys = { 'gc', 'gcc', 'gbc' },
  opts = {},
  config = function(_, opts)
    require('Comment').setup(opts)

    local ft = require('Comment.ft')

    ft({ 'ign' }, ft.get('c'))
  end
}
