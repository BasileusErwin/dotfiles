local g = vim.g
require("core.settings")
require("core.keymaps")

if not vim.g.vscode then
  local disabled_built_ins = {
    "2html_plugin",
    "getscript",
    "getscriptPlugin",
    "gzip",
    "logipat",
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "matchit",
    "matchparen",
    "tar",
    "tarPlugin",
    "rrhelper",
    "vimball",
    "vimballPlugin",
    "zip",
    "zipPlugin",
  }

  for _, plugin in pairs(disabled_built_ins) do
    g["loaded_" .. plugin] = 1
  end

  require("plugins").setup()
end

if vim.g.neovide then
  vim.g.neovide_cursor_animation_length = 0
  vim.g.neovide_scroll_animation_length = 0
  vim.g.neovide_cursor_trail_size = 0
  vim.g.neovide_scroll_animation_length = 2
  vim.g.neovide_no_idle = false
  vim.g.neovide_underline_automatic_scaling = false

  vim.g.neovide_transparency = 0.8
  vim.g.transparency = 0.8

  vim.g.neovide_refresh_rate = 120
  vim.g.neovide_refresh_rate_idle = 120
end


vim.cmd([[ colorscheme ayu-mirage ]])
