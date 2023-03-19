local g = vim.g
g.config = require('utils').load_json()

require('core')

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

vim.cmd([[ colorscheme ayu-dark ]])
