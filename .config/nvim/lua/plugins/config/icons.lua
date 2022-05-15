local M = {}
M.setup = function()
  local status_ok, web_devicons = pcall(require, 'nvim-web-devicons')
  if not status_ok then
    return
  end
  web_devicons.setup {
    override = {};
    default = true;
  }
end

return M
