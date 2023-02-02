local status_ok, dlsconfig = pcall(require, 'diagnosticls-configs')
if not status_ok then
  return
end

local fs = require('diagnosticls-configs.fs')
local util = require('lspconfig.util')

-- JS|TS
local eslint = require('diagnosticls-configs.linters.eslint')
local prettier = require('diagnosticls-configs.formatters.prettier')

-- lua
local stylua = require('diagnosticls-configs.formatters.stylua')
local luacheck = require('diagnosticls-configs.linters.luacheck')

-- Go
local golangci_lint = require('diagnosticls-configs.linters.golangci_lint')
local gofumpt = require('diagnosticls-configs.formatters.gofumpt')

-- Python
local pylint = require('diagnosticls-configs.linters.pylint')
local black = require('diagnosticls-configs.formatters.black')

-- Rust

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

local ts_fmt = prettier

-- if util.root_pattern('.eslintrc.json') then
--   ts_fmt = eslint_fmt
-- end

dlsconfig.setup {
  ['html'] = {
    formatter = prettier
  },
  ['css'] = {
    formatter = prettier
  },
  ['javascript'] = {
    linter = eslint,
    formatter = ts_fmt
  },
  ['javascriptreact'] = {
    linter = { eslint },
    formatter = ts_fmt
  },
  ['typescript'] = {
    linter = eslint,
    formatter = ts_fmt
  },
  ['typescriptreact'] = {
    linter = { eslint },
    formatter = ts_fmt
  },
  ['vue'] = {
    linter = { eslint },
    formatter = { prettier }
  },
  ['json'] = {
    formatter = { prettier }
  },
  ['lua'] = {
    linter = { luacheck },
    formatter = { stylua }
  },
  ['go'] = {
    linter = { golangci_lint },
    formatter = { gofumpt }
  },
  ['python'] = {
    linter = { pylint },
    formatter = { black }
  }
}
