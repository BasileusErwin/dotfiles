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

-- @parms builtin null-ls.utils.builtin
M.sources = function(builtin)
  return {
    -- Formatting
    builtin.formatting.prettier,
    builtin.formatting.shfmt,
    builtin.formatting.fixjson,
    builtin.formatting.black.with({ extra_args = { '--fast' } }),
    builtin.formatting.isort,
    builtin.formatting.rustfmt,
    builtin.formatting.taplo,
    M.with_root_file(builtin.formatting.stylua, 'stylua.toml'),

    -- diagnostics
    builtin.diagnostics.write_good,
    builtin.diagnostics.ltrs,
    builtin.diagnostics.markdownlint,
    builtin.diagnostics.eslint,
    builtin.diagnostics.flake8,
    builtin.diagnostics.tsc,
    M.with_root_file(builtin.diagnostics.selene, "selene.toml"),
    M.with_diagnostics_code(builtin.diagnostics.shellcheck),

    -- code actions
    builtin.code_actions.gitsigns,
    builtin.code_actions.gitrebase,
    builtin.code_actions.refactoring,

    -- hover
    builtin.hover.dictionary,
  }
end


M.setup = function(opts)
  local status_ok, nls = pcall(require, 'null-ls')

  if not status_ok then
    return
  end

  M.nls_utils = require('null-ls.utils')
  M.builtins = nls.builtins
  M.sources = M.sources(M.builtins)

  nls.setup({
    debounce = 150,
    save_after_format = false,
    sources = M.sources,
    on_attach = opts.on_attach,
    root_dir = M.nls_utils.root_pattern ".git",
  })
end

return M
