local M = {}
local utils = require('utils')
local servers = require('config.lsp.servers')

vim.g.markdown_fenced_languages = {
  'ts=typescript'
}
vim.fn.sign_define('LspDiagnosticsSignError',
  { texthl = 'LspDiagnosticsSignError', text = '', numhl = 'LspDiagnosticsSignError' }
)
vim.fn.sign_define(
  'LspDiagnosticsSignWarning',
  { texthl = 'LspDiagnosticsSignWarning', text = '', numhl = 'LspDiagnosticsSignWarning' }
)
vim.fn.sign_define(
  'LspDiagnosticsSignHint',
  { texthl = 'LspDiagnosticsSignHint', text = '', numhl = 'LspDiagnosticsSignHint' }
)
vim.fn.sign_define(
  'LspDiagnosticsSignInformation',
  { texthl = 'LspDiagnosticsSignInformation', text = '', numhl = 'LspDiagnosticsSignInformation' }
)

M.on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  require('config.lsp.keymaps').setup(client, bufnr)
end

M.capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
M.capabilities.textDocument.completion.completionItem.snippetSupport = true

-- icon
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    -- This sets the spacing and the prefix, obviously.
    virtual_text = {
      spacing = 4,
      prefix = ''
    }
  })

M.setup = function()
  local status_ok, nvim_lsp = pcall(require, 'lspconfig')
  if not status_ok then
    return
  end

  local util = require('lspconfig.util')

  M.opts = {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
  }

  local status_ok_dls, dlsconfig = pcall(require, 'diagnosticls-configs')
  if status_ok_dls then
    dlsconfig.init({
      on_attach = M.on_attach,
      capabilities = M.capabilities,
    })
  end

  require('config.lsp.null_ls').setup(M.opts)
  require('config.lsp.mason').setup()


  nvim_lsp.ltex.setup(
    {
      cmd = { "ltex-ls" },
      filetypes = { "markdown", "text" },
      flags = { debounce_text_changes = 300 },
      settings = {
        ltex = {
          language = "auto",
        },
      },
      on_attach = M.on_attach,
      capabilities = M.capabilities,
    }
  )

  for _, server in ipairs(servers) do
    if server.enable then
      if server.server_name == 'metals' then
        nvim_lsp.metals.setup(
          utils.merge_table(
            {
              root_dir = util.root_pattern("build.sbt", "build.sc", "build.gradle", "pom.xml", "*.scala")
            },
            M.opts
          )
        )
      end
      if server.server_name == 'denols' then
        nvim_lsp.denols.setup(
          utils.merge_table(
            {
              root_dir = util.root_pattern('deno.json'),
            },
            M.opts
          )
        )
      elseif server.server_name == 'tsserver' then
        nvim_lsp.tsserver.setup(
          utils.merge_table(
            {
              root_dir = util.root_pattern('package.json'),
              preferences = {
                quotePreference = 'single',
                importModuleSpecifierPreference = 'relative',
                includeCompletionsForImportStatements = true
              },
            },
            M.opts
          )
        )
      elseif server.server_name == 'jsonls' then
        local status_schmeastore_ok, schemastore = pcall(require, 'schemastore')
        if status_schmeastore_ok then
          nvim_lsp.jsonls.setup(
            utils.merge_table(
              {
                settings = {
                  json = {
                    schemas = schemastore.json.schemas({
                      select = {
                        '.eslintrc',
                        'package.json',
                      },
                    }
                    ),
                    validate = { enable = true }
                  }
                }
              },
              M.opts
            )
          )
        end
      elseif server.server_name == 'omnisharp' then
        local pid = vim.fn.getpid()
        nvim_lsp.omnisharp.setup(
          utils.merge_table(
            {
              cmd = { 'omnisharp', '--languageserver', '--hostPID', tostring(pid) }
            },
            M.opts
          )
        )
      else
        nvim_lsp[server.server_name].setup(M.opts)
      end
    end
  end
end

return M
