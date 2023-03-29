return {
  "epwalsh/obsidian.nvim",
  event = "VeryLazy",
  dependencies = {
    'nvim-lua/plenary.nvim',
    'hrsh7th/nvim-cmp',
    'junegunn/fzf',
    'junegunn/fzf.vim',
    'ibhagwan/fzf-lua',
  },
  opts = {
    dir = '~/Documents/Obsidian Vault',
    completion = {
      nvim_cmp = true
    },
  }
}
