local on_attach = require('config.lsp').on_attach
return {
  'mrcjkb/rustaceanvim',
  version = '^3',
  ft = { 'rust' },
  name = 'rust-tools',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'ron-rs/ron.vim',
    'vxpm/ferris.nvim',
  },
  config = function()
    vim.cmd([[
      let g:rust_recommended_style = 0
      let g:rust_clip_command = 'xclip -selection clipboard'
    ]])

    vim.g.rustaceanvim = {
      on_attach,
    }
  end
}
