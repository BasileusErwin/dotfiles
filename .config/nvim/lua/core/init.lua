local g = vim.g

g.config = require('utils').load_json()

require('core.keymaps')
if not vim.g.vscode then
  require('core.settings')
  require('core.lazy')

  vim.cmd.colorscheme(g.config.theme.name)
end

