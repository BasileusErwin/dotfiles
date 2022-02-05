local dlsconfig = require 'diagnosticls-configs'
local fs =require('diagnosticls-configs.fs')
local eslint = require 'diagnosticls-configs.linters.eslint'
local prettier = require 'diagnosticls-configs.formatters.prettier'
local stylua = require 'diagnosticls-configs.formatters.stylua'

prettier = vim.tbl_extend('force', prettier, {
  sourceName = 'prettier',
  command = fs.executable('prettier'),
  args = { '--stdin', '--stdin-filepath', '%filepath' },
  rootPatterns = {
    '.prettierrc',
    '.prettierrc.json',
    '.prettierrc.toml',
    '.prettierrc.json',
    '.prettierrc.yml',
    '.prettierrc.yaml',
    '.prettierrc.json5',
    '.prettierrc.js',
    '.prettierrc.cjs',
    'prettier.config.js',
    'prettier.config.cjs',
  },
})

dlsconfig.setup {
  ['html'] = {
    formatter = prettier
  },
  ['css'] = {
    formatter = prettier
  },
  ['javascript'] = {
    linter = eslint,
    formatter = prettier
  },
  ['javascriptreact'] = {
    linter = { eslint },
    formatter = { prettier }
  },
  ['typescript'] = {
    linter = eslint,
    formatter = prettier
  },
  ['typescriptreact'] = {
    linter = { eslint },
    formatter = { prettier }
  },
  ['json'] = {
    formatter = { prettier }
  },
  ['lua'] = {
    formatter = { stylua }
  }
}

