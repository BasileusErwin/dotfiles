local M = {}

M.setup = function ()
  local status_ok, refactoring = pcall(require, 'refactoring')

  if not status_ok then
  return
  end

  refactoring.setup()
end

return M
