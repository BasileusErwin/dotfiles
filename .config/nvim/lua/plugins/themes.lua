return {
  {
    'Shatur/neovim-ayu',
    lazy = true,
    event = 'VeryLazy',
  },
  {
    'navarasu/onedark.nvim',
    lazy = true,
    event = 'VeryLazy',
  },
  {
    'marko-cerovac/material.nvim'
    ,
    lazy = true,
    event = 'VeryLazy',
  },
  {
    'tomasiser/vim-code-dark',
    lazy = true,
    event = 'VeryLazy',
  },
  {
    'tanvirtin/monokai.nvim',
    lazy = true,
    event = 'VeryLazy',
  },
  {
    'Shatur/neovim-ayu',
    lazy = true,
    event = 'VeryLazy',
  },
  {
    'ghifarit53/tokyonight-vim',
    lazy = true,
    event = 'VeryLazy',
  },
  {
    'tiagovla/tokyodark.nvim',
    lazy = true,
    event = 'VeryLazy',
  },
  {
    'phanviet/vim-monokai-pro',
    lazy = true,
    event = 'VeryLazy',
  },
  {
    'shaunsingh/nord.nvim',
    lazy = true,
    event = 'VeryLazy',
  },
  {
    'projekt0n/github-nvim-theme',
    lazy = true,
    event = 'VeryLazy',
  },
  {
    'JoosepAlviste/palenightfall.nvim',
    lazy = true,
    event = 'VeryLazy',
  },
  {
    'VDuchauffour/neodark.nvim',
    lazy = true,
    event = 'VeryLazy',
  },
  {
    'uloco/bluloco.nvim',
    lazy = false,
    priority = 1000,
    dependencies = { 'rktjmp/lush.nvim' },
    opts = {
      style       = "dark",
      transparent = true,
      italics     = true,
      terminal    = vim.fn.has("gui_running") == 1, -- bluoco colors are enabled in gui terminals per default.
      guicursor   = true,
    }
  },
}
