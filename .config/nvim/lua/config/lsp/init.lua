local M = {}
local utils = require('utils')

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

M.servers = {
  {
    package_name = 'jdtls',
    server_name = 'jdtls',
    enable = true
  },
  {
    package_name = 'deno',
    server_name = 'denols',
    enable = false
  },
  {
    package_name = 'intelephense',
    server_name = 'intelephense',
    enable = true
  },
  {

    package_name = 'bash-language-server',
    server_name = 'bashls',
    enable = true
  },
  {
    package_name = 'html-lsp',
    server_name = 'html',
    enable = true
  },
  {
    package_name = 'haskell-language-server',
    server_name = 'hls',
    enable = true
  },
  {
    package_name = 'rust-analyzer',
    server_name = 'rust_analyzer',
    enable = true
  },
  {
    package_name = 'yaml-language-server',
    server_name = 'yamlls',
    enable = true
  },
  {
    package_name = 'typescript-language-server',
    server_name = 'tsserver',
    enable = true
  },
  {
    package_name = 'vim-language-server',
    server_name = 'vimls',
    enable = true
  },
  {
    package_name = 'vetur-vls',
    server_name = 'volar',
    enable = true
  },
  {
    package_name = 'eslint-lsp',
    server_name = 'eslint',
    enable = true
  },
  {
    package_name = 'json-lsp',
    server_name = 'jsonls',
    enable = true
  },
  {
    package_name = 'lua-language-server',
    server_name = 'sumneko_lua',
    enable = true
  },
  {
    package_name = 'pyright',
    server_name = 'pyright',
    enable = true
  },
  {
    package_name = 'sqls',
    server_name = 'sqls',
    enable = true
  },
  {
    package_name = 'css-lsp',
    server_name = 'cssls',
    enable = true
  },
  {
    package_name = 'zls',
    server_name = 'zls',
    enable = true
  },
  {
    package_name = 'diagnostic-languageserver',
    server_name = 'diagnosticls',
    enable = true
  },
  {
    package_name = 'clangd',
    server_name = 'clangd',
    enable = true
  },
  {
    package_name = 'cmake-language-server',
    server_name = 'cmake',
    enable = true
  },
  {
    package_name = 'dockerfile-language-server',
    server_name = 'dockerls',
    enable = true
  },
  {
    package_name = 'emmet-ls',
    server_name = 'emmet_ls',
    enable = true
  },
  {
    package_name = 'gopls',
    server_name = 'gopls',
    enable = true
  },
  {
    package_name = 'taplo',
    server_name = 'taplo',
    enable = true
  }
}

vim.g.markdown_fenced_languages = {
  'ts=typescript'
}

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

  -- require('config.lsp.null_ls').setup(M.opts)

  for _, server in ipairs(M.servers) do
    if server.enable then
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
