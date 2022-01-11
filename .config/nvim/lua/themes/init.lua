local lualine_config = require('plugins.config.lualine')

vim.cmd([[
	set termguicolors
	let ayucolor="mirage"
  let g:tokyonight_style = "storm"
  colorscheme tokyonight
]])

lualine_config.set_theme('dracula')
