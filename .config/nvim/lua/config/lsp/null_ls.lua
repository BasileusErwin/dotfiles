local M = {}

M.with_diagnostics_code = function(builtin)
  return builtin.with({
    diagnostics_format = '#{m} [#{c}]',
  })
end

M.with_root_file = function(builtin, file)
  return builtin.with({
    condition = function(utils)
      return utils.root_has_file(file)
    end
  })
end

M.setup = function(opts)
  local status_ok, nls = pcall(require, 'null-ls')

  if not status_ok then
    return
  end

  M.nls_utils = require('null-ls.utils')
  local builtin = nls.builtins

  nls.setup({
    debounce = 5000,
    save_after_format = false,
    update_in_insert = false,
    sources = {
      -- Formatting
      M.with_root_file(builtin.formatting.prettier, '.prettierrc'),
      builtin.formatting.shfmt,
      builtin.formatting.fixjson,
      builtin.formatting.black.with({ extra_args = { '--fast' } }),
      builtin.formatting.isort,
      M.with_root_file(builtin.formatting.rome, 'rome.json'),
      builtin.formatting.rustfmt.with({
        extra_args = { "--edition=2021" }
      }),
      M.with_root_file(builtin.formatting.stylua, 'stylua.toml'),

      -- diagnostics
      builtin.diagnostics.write_good,
      builtin.diagnostics.ltrs,
      builtin.diagnostics.markdownlint,
      builtin.diagnostics.flake8,
      builtin.diagnostics.tsc.with({
        method = nls.methods.DIAGNOSTICS_ON_SAVE,
      }),
      M.with_root_file(builtin.diagnostics.eslint.with({
        method = nls.methods.DIAGNOSTICS_ON_SAVE,
      }), '.eslintrc.json'),
      M.with_root_file(builtin.diagnostics.selene, "selene.toml"),
      M.with_diagnostics_code(builtin.diagnostics.shellcheck),

      -- code actions
      builtin.code_actions.gitsigns,
      builtin.code_actions.gitrebase,
      builtin.code_actions.refactoring,
      builtin.code_actions.shellcheck,

      -- hover
      builtin.hover.dictionary,
    },
    on_attach = opts.on_attach,
    root_dir = M.nls_utils.root_pattern(".git"),
  })
end

return M
