local lualine_config = require('plugins.config.lualine')

local themes_config = {
  'themes.config.tokyodark',
  'themes.config.tokyonight',
  'themes.config.material',
  'themes.config.github_theme',
  'themes.config.palenightfall',
  'themes.config.neodark',
  'themes.config.onedark',
  'themes.config.catppuccin',
  'themes.config.ayu'
}

for _, module in ipairs(themes_config) do
  local ok, err = pcall(require, module)
end

vim.cmd 'colorscheme ayu'

lualine_config.set_theme('auto')
