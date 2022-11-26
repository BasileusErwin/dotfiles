local g = vim.g
require("core.settings")

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
  -- require("themes")
end

vim.cmd([[ colorscheme ayu-mirage ]])
