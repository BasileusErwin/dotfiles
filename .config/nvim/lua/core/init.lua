local g = vim.g

require('core.keymaps')
require('core.settings')
require('core.lazy')

g.config = require('utils').load_json()

if g.neovide then
   g.neovide_cursor_animation_length = 0
   g.neovide_scroll_animation_length = 0
   g.neovide_cursor_trail_size = 0
   g.neovide_scroll_animation_length = 2
   g.neovide_no_idle = false
   g.neovide_underline_automatic_scaling = false

   g.neovide_transparency = 0.8
   g.transparency = 0.8

   g.neovide_refresh_rate = 120
   g.neovide_refresh_rate_idle = 120
end

vim.cmd([[ ]] .. "colorscheme " .. vim.g.config.theme)

