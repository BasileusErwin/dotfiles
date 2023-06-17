return {
  { 'elkowar/yuck.vim' },
  { 'chaoren/vim-wordmotion' },
  { 'tweekmonster/startuptime.vim' },
  { 'jidn/vim-dbml' },
  { 'ollykel/v-vim' },
  { 'vim-crystal/vim-crystal' },
  {
    'prabirshrestha/asyncomplete.vim',
    'prabirshrestha/async.vim',
    'prabirshrestha/vim-lsp',
    'prabirshrestha/asyncomplete-lsp.vim',
  },
  {
    'wthollingsworth/pomodoro.nvim',
    dependecies = {
      'MunifTanjim/nui.nvim'
    },
    opts = {
      time_work = 25,
      time_break_short = 5,
      time_break_long = 20,
      timers_to_long_break = 4
    }
  }
}
