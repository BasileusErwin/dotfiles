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
      error("Error loading " .. module .. "\n\n" .. err)
   end
end


vim.cmd([[
	set termguicolors
  colorscheme tokyodark
]])

lualine_config.set_theme('auto')
