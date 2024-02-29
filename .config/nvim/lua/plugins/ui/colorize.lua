return {
  'norcalli/nvim-colorizer.lua',
  event = "BufRead",
  config = function()
    require('colorizer').setup(
    {
      '*',
      'javascript.jsx',
    },
    {
      rgb      = true,
      rrggbb   = true,
      names    = true,
      rrggbbaa = true,
      rgb_fn   = true,
      hsl_fn   = true,
      css      = true,
      css_fn   = true,
    }
  )
  end
}
