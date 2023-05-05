local M = {}
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

  for _, server in ipairs(servers) do
    if server.enable then
      server.config(M.on_attach, M.capabilities)
    end
  end

  require('lsp-colors').setup({
    Error = '#db4b4b',
    Warning = '#e0af68',
    Information = '#0db9d7',
    Hint = '#10B981'
  })
end

return M
