local status_ok, colorizer = pcall(require, 'colorizer')
if not status_ok then
  return
end

colorizer.setup (
  {
    '*';
   'javascript.jsx';
  },
  {
		rgb      = true;         -- #rgb hex codes
	  rrggbb   = true;         -- #rrggbb hex codes
	  names    = true;         -- "name" codes like blue
	  rrggbbaa = true;         -- #rrggbbaa hex codes
	  rgb_fn   = true;         -- css rgb() and rgba() functions
	  hsl_fn   = true;         -- css hsl() and hsla() functions
	  css      = true;         -- enable all css features: rgb_fn, hsl_fn, names, rgb, rrggbb
	  css_fn   = true;         -- enable all css *functions*: rgb_fn, hsl_fn
  }
)

