return {
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {}
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    'ActivityWatch/aw-watcher-vim',
    enabled = true,
  },
  { 'elkowar/yuck.vim' },
  { 'tweekmonster/startuptime.vim' },
  { 'jidn/vim-dbml' },
  {
    'RaafatTurki/hex.nvim',
    config = function()
      require('hex').setup()
    end
  },
}
