return {
  { 'Shatur/neovim-ayu' },
  { 'navarasu/onedark.nvim' },
  { 'marko-cerovac/material.nvim' },
  { 'tomasiser/vim-code-dark' },
  { 'tanvirtin/monokai.nvim' },
  { 'Shatur/neovim-ayu' },
  { 'ghifarit53/tokyonight-vim' },
  { 'tiagovla/tokyodark.nvim' },
  { 'phanviet/vim-monokai-pro' },
  { 'shaunsingh/nord.nvim' },
  { 'projekt0n/github-nvim-theme' },
  { 'JoosepAlviste/palenightfall.nvim' },
  { 'VDuchauffour/neodark.nvim' },
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
