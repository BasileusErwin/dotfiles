local lualine_config = require('plugins.config.lualine')

local themes_config = {
  'themes.config.onedark',
  'themes.config.tokyodark',
  'themes.config.tokyonight',
  'themes.config.material',
}

for _, module in ipairs(themes_config) do
   local ok, err = pcall(require, module)
   if not ok then
    return
   end
end

vim.cmd([[
  set termguicolors
  colorscheme tokyonight
]])

lualine_config.set_theme('auto')
