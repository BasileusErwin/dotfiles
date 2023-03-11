return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.1',
  branch = '0.1.1',
  cmd = { 'Telescope' },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      dependencies = {
        "junegunn/fzf.vim",
        dependencies = {
          {
            "tpope/vim-dispatch",
            cmd = { "Make", "Dispatch" }
          },
        },
      }
    },
  },
  config = function()
    require('config.telescope').setup()
  end
}
