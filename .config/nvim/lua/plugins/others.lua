return {
  {
    "vifm/vifm.vim",
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    'ActivityWatch/aw-watcher-vim',
  },
  { 'elkowar/yuck.vim' },
  { 'tweekmonster/startuptime.vim' },
  { 'jidn/vim-dbml' },
  { 'vim-crystal/vim-crystal' },
  {
    -- 'prabirshrestha/asyncomplete.vim',
    -- 'prabirshrestha/async.vim',
    -- 'prabirshrestha/vim-lsp',
    -- 'prabirshrestha/asyncomplete-lsp.vim',
  },
  {
    'wthollingsworth/pomodoro.nvim',
    enabled = false,
    dependecies = {
      'MunifTanjim/nui.nvim'
    },
    opts = {
      time_work = 25,
      time_break_short = 5,
      time_break_long = 20,
      timers_to_long_break = 4
    }
  },
  {
    'RaafatTurki/hex.nvim',
    config = function()
      require('hex').setup()
    end
  },
  { 'wakatime/vim-wakatime', enabled = false },
  {
    "jiaoshijie/undotree",
    dependencies = "nvim-lua/plenary.nvim",
    config = true,
    keys = { -- load the plugin only when using it's keybinding:
      { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
    },
  }
}
