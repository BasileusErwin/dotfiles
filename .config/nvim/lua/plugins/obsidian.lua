return {
  "epwalsh/obsidian.nvim",
  dependencies = {
    'nvim-lua/plenary.nvim',
    'hrsh7th/nvim-cmp',
    'junegunn/fzf',
    'junegunn/fzf.vim',
    'ibhagwan/fzf-lua',
    'nvim-telescope/telescope.nvim',
  },
  opts = {
    dir = '~/Documents/Obsidian Vault',
    completion = {
      nvim_cmp = true
    },
  }
}
