local M = {}
local lsp = require('config.lsp')

local get_package_name = function()
  local package_name = {}

  for _, server in ipairs(lsp.servers) do
    if server.enable or server.package_name ~= nil then
      table.insert(package_name, server.package_name)
    end
  end

  return package_name
end

M.setup = function()
  local status_ok, mason = pcall(require, 'mason')
  local status_tool_ok, mason_tool = pcall(require, 'mason-tool-installer')

  if not status_ok or not status_tool_ok then
    return
  end

  mason.setup({
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗"}
    }
  })

  mason_tool.setup({
    ensure_installed = get_package_name(),
    run_on_start = true,
    auto_update = false,
    start_delay = 3000
  })
end

return M
