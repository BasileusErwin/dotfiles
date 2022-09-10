require("plugins.config.impatient")
require("core.settings")
require("core.keys")

if not vim.g.vscode then
  require("plugins")
  require("themes")
end
