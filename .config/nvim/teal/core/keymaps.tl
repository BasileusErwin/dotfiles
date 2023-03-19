require('types.config')

local config: Config = vim.g.config as Config
local map = vim.api.nvim_set_keymap

for _, value in ipairs(config.keymaps.maps.insert) do
  if not value.vscode and vim.g.vscode then
    goto continue
  end

  map("i", value.key, value.command, config.keymaps.opts)

  ::continue::
end

for _, value in ipairs(config.keymaps.maps.normal) do
  if not value.vscode and vim.g.vscode then
    goto continue
  end

  map("n", value.key, value.command, config.keymaps.opts)

  ::continue::
end

for _, value in ipairs(config.keymaps.maps.visual) do
  if not value.vscode and vim.g.vscode then
    goto continue
  end

  map("v", value.key, value.command, config.keymaps.opts)

  ::continue::
end

