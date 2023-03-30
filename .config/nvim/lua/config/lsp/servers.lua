local util = require('lspconfig.util')

return {
  {
    package_name = "prisma-language-server",
    server_name = "prismals",
    enable = true,
    config = function(on_attach, capabilities)
      return {
        root_dir = util.root_pattern(".git", "package.json", "*.prisma"),
        on_attach,
        capabilities,
      }
    end
  },
  {
    package_name = 'rome',
    server_name = 'rome',
    enable = true,
    config = function(on_attach, capabilities)
      return {
        root_dir = util.root_pattern('rome.json', 'node_modules/rome', 'node_modules/@rometools'),
        on_attach,
        capabilities,
      }
    end
  },
  {
    package_name = "ltex-ls",
    server_name = "ltex",
    enable = true,
    config = function(on_attach, capabilities)
      return {
        filetypes = { "markdown", "text", "gitcommit" },
        flags = { debounce_text_changes = 500 },
        settings = {
          ltex = {
            language = "es",
          },
        },
        on_attach,
        capabilities,
      }
    end
  },
  {
    package_name = 'teal-language-server',
    server_name = 'teal_ls',
    enable = true,
    config = function(on_attach, capabilities)
      return {
        on_attach,
        capabilities
      }
    end
  },
  {
    package_name = nil,
    server_name = 'metals',
    enable = true,
    config = function(on_attach, capabilities)
      return {
        root_dir = util.root_pattern("build.sbt", "build.sc", "build.gradle", "pom.xml", "*.scala"),
        on_attach,
        capabilities
      }
    end
  },
  {
    package_name = 'jdtls',
    server_name = 'jdtls',
    enable = true,
    config = function(on_attach, capabilities)
      return {
        on_attach,
        capabilities
      }
    end
  },
  {
    package_name = 'deno',
    server_name = 'denols',
    enable = false,
    config = function(on_attach, capabilities)
      return {
        root_dir = util.root_pattern('deno.json'),
        on_attach,
        capabilities
      }
    end
  },
  {
    package_name = 'intelephense',
    server_name = 'intelephense',
    enable = true,
    config = function(on_attach, capabilities)
      return {
        on_attach,
        capabilities
      }
    end
  },
  {
    package_name = 'bash-language-server',
    server_name = 'bashls',
    enable = true,
    config = function(on_attach, capabilities)
      return {
        on_attach,
        capabilities
      }
    end
  },
  {
    package_name = 'html-lsp',
    server_name = 'html',
    enable = true,
    config = function(on_attach, capabilities)
      return {
        on_attach,
        capabilities
      }
    end
  },
  {
    package_name = 'haskell-language-server',
    server_name = 'hls',
    enable = true,
    config = function(on_attach, capabilities)
      return {
        on_attach,
        capabilities
      }
    end
  },
  {
    package_name = 'rust-analyzer',
    server_name = 'rust_analyzer',
    enable = true,
    config = function(on_attach, capabilities)
      return {
        on_attach,
        capabilities
      }
    end
  },
  {
    package_name = 'yaml-language-server',
    server_name = 'yamlls',
    enable = true,
    config = function(on_attach, capabilities)
      return {
        on_attach,
        capabilities
      }
    end
  },
  {
    package_name = 'typescript-language-server',
    server_name = 'tsserver',
    enable = true,
    config = function(on_attach, capabilities)
      return {
        root_dir = util.root_pattern('package.json'),
        preferences = {
          quotePreference = 'single',
          importModuleSpecifierPreference = 'relative',
          includeCompletionsForImportStatements = true
        },
        on_attach,
        capabilities,
      }
    end
  },
  {
    package_name = 'vim-language-server',
    server_name = 'vimls',
    enable = true,
    config = function(on_attach, capabilities)
      return {
        on_attach,
        capabilities
      }
    end
  },
  {
    package_name = 'vetur-vls',
    server_name = 'volar',
    enable = true,
    config = function(on_attach, capabilities)
      return {
        on_attach,
        capabilities
      }
    end
  },
  {
    package_name = 'eslint-lsp',
    server_name = 'eslint',
    enable = true,
    config = function(on_attach, capabilities)
      return {
        root_dir = util.root_pattern('.eslintrc.json'),
        on_attach,
        capabilities
      }
    end
  },
  {
    package_name = 'json-lsp',
    server_name = 'jsonls',
    enable = true,
    config = function(on_attach, capabilities)
      local status_schmeastore_ok, schemastore = pcall(require, 'schemastore')
      return {
        on_attach,
        capabilities,
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
      }
    end,
  },
  {
    package_name = 'lua-language-server',
    server_name = 'lua_ls',
    enable = true,
    config = function(on_attach, capabilities)
      return {
        on_attach,
        capabilities
      }
    end
  },
  {
    package_name = 'pyright',
    server_name = 'pyright',
    enable = true,
    config = function(on_attach, capabilities)
      return {
        on_attach,
        capabilities
      }
    end
  },
  {
    package_name = 'sqls',
    server_name = 'sqls',
    enable = true,
    config = function(on_attach, capabilities)
      return {
        on_attach,
        capabilities
      }
    end
  },
  {
    package_name = 'css-lsp',
    server_name = 'cssls',
    enable = true,
    config = function(on_attach, capabilities)
      return {
        on_attach,
        capabilities
      }
    end
  },
  {
    package_name = 'zls',
    server_name = 'zls',
    enable = true,
    config = function(on_attach, capabilities)
      return {
        on_attach,
        capabilities
      }
    end
  },
  {
    package_name = 'diagnostic-languageserver',
    server_name = 'diagnosticls',
    enable = true,
    config = function(on_attach, capabilities)
      return {
        on_attach,
        capabilities
      }
    end
  },
  {
    package_name = 'clangd',
    server_name = 'clangd',
    enable = true,
    config = function(on_attach, capabilities)
      return {
        on_attach,
        capabilities
      }
    end
  },
  {
    package_name = 'cmake-language-server',
    server_name = 'cmake',
    enable = true,
    config = function(on_attach, capabilities)
      return {
        on_attach,
        capabilities
      }
    end
  },
  {
    package_name = 'dockerfile-language-server',
    server_name = 'dockerls',
    enable = true,
    config = function(on_attach, capabilities)
      return {
        on_attach,
        capabilities
      }
    end
  },
  {
    package_name = 'emmet-ls',
    server_name = 'emmet_ls',
    enable = true,
    config = function(on_attach, capabilities)
      return {
        on_attach,
        capabilities
      }
    end
  },
  {
    package_name = 'gopls',
    server_name = 'gopls',
    enable = true,
    config = function(on_attach, capabilities)
      return {
        on_attach,
        capabilities
      }
    end
  },
  {
    package_name = 'taplo',
    server_name = 'taplo',
    enable = true,
    config = function(on_attach, capabilities)
      return {
        on_attach,
        capabilities
      }
    end
  },
  {
    package_name = "omnisharp",
    server_name = "omnisharp",
    enable = true,
    config = function(on_attach, capabilities)
      local pid = vim.fn.getpid()
      return {
        cmd = { 'omnisharp', '--languageserver', '--hostPID', tostring(pid) },
        on_attach,
        capabilities,
      }
    end
  }
}
