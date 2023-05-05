return {
  { 'EdenEast/nightfox.nvim' },
  { 'frenzyexists/aquarium-vim' },
  { 'sainnhe/everforest' },
  {
    'navarasu/onedark.nvim',
    lazy = true,
    event = 'VeryLazy',
    opts = {
      style = vim.g.config.theme.style,
      transparent = vim.g.config.theme.transparent,
      code_style = {
        comments = 'italic',
        keywords = 'bold',
        functions = 'bold',
        strings = 'italic',
        variables = 'none'
      },
      lualine = {
        transparent = vim.g.config.theme.lualine.transparent,
      },
      diagnostics = {
        darker = true,       -- darker colors for diagnostic
        undercurl = true,    -- use undercurl instead of underline for diagnostics
        background = true,   -- use background color for virtual text
      },
    }
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
    name = 'ayu',
    config = function()
      require('ayu').setup({
        mirage = vim.g.config.theme.style == 'mirage',
      })
    end,
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
