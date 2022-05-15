local M = {}
M.setup = function()
  local lualine_config = require('plugins.config.lualine')

  local themes_config = {
    'themes.config.onedark',
    'themes.config.tokyodark',
    'themes.config.tokyonight',
    'themes.config.material',
    'themes.config.github_theme',
    'themes.config.palenightfall',
    'themes.config.neodark',
  }

  for _, module in ipairs(themes_config) do
    local ok, err = pcall(require, module)
    if not ok then
      return
    end
  end

  vim.cmd 'colorscheme tokyodark'

  lualine_config.set_theme('auto')
end

return M
