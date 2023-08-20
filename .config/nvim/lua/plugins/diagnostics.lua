return {
  'creativenull/diagnosticls-configs-nvim',
  enabled = true,
  dependencies = 'neovim/nvim-lspconfig',
  config = function()
    local dlsconfig = require('diagnosticls-configs')

    -- JS|TS
    local eslint = require('diagnosticls-configs.linters.eslint')

    dlsconfig.setup {
      ['javascript'] = {
        linter = eslint,
      },
      ['javascriptreact'] = {
        linter = { eslint },
      },
      ['typescript'] = {
        linter = eslint,
      },
      ['typescriptreact'] = {
        linter = { eslint },
      },
      ['vue'] = {
        linter = { eslint },
      },
    }
  end
}
