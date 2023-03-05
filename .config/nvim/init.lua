local g = vim.g

if not g.vscode then
  vim.opt.termguicolors = true -- Enable colors in terminal
  local disabled_built_ins = {
    "html_plugin",
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
