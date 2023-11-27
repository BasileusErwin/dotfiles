local g = vim.g

g.config = require('utils').load_json()

require('core.keymaps')
require('core.settings')
if not vim.g.vscode then
  require('core.lazy')

  vim.cmd.colorscheme(g.config.theme.name)
end


