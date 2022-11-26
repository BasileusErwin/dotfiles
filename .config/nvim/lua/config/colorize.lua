local M = {}

M.setup = function()
  local status_ok, colorizer = pcall(require, 'colorizer')
  if not status_ok then
    return
  end

  colorizer.setup(
    {
      '*';
      'javascript.jsx';
    },
    {
      rgb      = true;
      rrggbb   = true;
      names    = true;
      rrggbbaa = true;
      rgb_fn   = true;
      hsl_fn   = true;
      css      = true;
      css_fn   = true;
    }
  )
end

return M
