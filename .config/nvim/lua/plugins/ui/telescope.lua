return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.4',
  cmd = { 'Telescope' },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make'
    }
  },
  config = function()
    require('config.telescope').setup()
  end
}
