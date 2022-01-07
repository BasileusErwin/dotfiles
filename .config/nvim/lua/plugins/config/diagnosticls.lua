local dlsconfig = require 'diagnosticls-configs'
local eslint = require 'diagnosticls-configs.linters.eslint'
local standard = require 'diagnosticls-configs.linters.standard'
local prettier = require 'diagnosticls-configs.formatters.prettier'
local prettier_standard = require 'diagnosticls-configs.formatters.prettier_standard'

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
    linter = { eslint, standard },
    formatter = { prettier, prettier_standard }
  },
  ['typescript'] = {
    linter = eslint,
    formatter = prettier
  },
  ['typescriptreact'] = {
    linter = { eslint, standard },
    formatter = { prettier, prettier_standard }
  },
}

