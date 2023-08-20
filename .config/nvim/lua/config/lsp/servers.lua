local util = require('lspconfig.util')
local lspconfig = require("lspconfig")

return {
  {
    package_name = 'efm',
    enable = true,
    config = function(on_attach, capabilities)
      lspconfig.efm.setup({
        on_attach,
        capabilities
      })
    end
  },
  {
    package_name = "asm-lsp",
    enable = true,
    config = function(on_attach, capabilities)
      lspconfig.asm_lsp.setup({
        on_attach,
        capabilities
      })
    end
  },
  {
    package_name = "ocaml-lsp",
    enable = true,
    config = function(on_attach, capabilities)
      lspconfig.ocamllsp.setup({
        on_attach,
        capabilities
      })
    end
  },
  {
    package_name = 'nimlsp',
    enable = false,
    config = function(on_attach, capabilities)
      vim.cmd([[set omnifunc=v:lua.vim.lsp.omnifunc]])

      lspconfig.nimls.setup({
        on_attach,
        capabilities,
        cmd = { "nimlsp" }
      })
    end
  },
  {
    package_name = 'crystalline',
    enable = true,
    config = function(on_attach, capabilities)
      lspconfig.crystalline.setup({
        on_attach,
        capabilities,
      })
    end
  },
  {
    package_name = 'tailwindcss-language-server',
    enable = true,
    config = function(on_attach, capabilities)
      lspconfig.tailwindcss.setup({
        on_attach,
        capabilities,
        filetypes = {
          "css",
          "scss",
          "sass",
          "postcss",
          "html",
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
          "svelte",
          "vue",
          "rust",
        },
        init_options = {
          userLanguages = {
            rust = "html",
          },
        },
        root_dir = util.root_pattern('tailwind.config.js', 'tailwind.config.ts', 'postcss.config.js',
          'postcss.config.ts', 'windi.config.ts'),
      })
    end
  },
  {
    package_name = 'vue-language-server',
    enable = true,
    config = function(on_attach, capabilities)
      lspconfig.volar.setup({
        on_attach,
        capabilities,
      })
    end
  },
  {
    package_name = 'vls',
    enable = true,
    config = function(on_attach, capabilities)
      lspconfig.vls.setup({
        root_dir = util.root_pattern("v.mod", ".git"),
        on_attach,
        capabilities,
      })
    end
  },
  {
    package_name = "prisma-language-server",
    enable = true,
    config = function(on_attach, capabilities)
      lspconfig.prismals.setup({
        root_dir = util.root_pattern("*.prisma"),
        on_attach,
        capabilities,
      })
    end
  },
  {
    package_name = 'rome',
    enable = util.root_pattern("rome.json")(vim.fn.expand('%:p')),
    config = function(on_attach, capabilities)
      lspconfig.rome.setup({
        root_dir = util.root_pattern("rome.json"),
        on_attach,
        capabilities,
      })
    end
  },
  {
    package_name = "ltex-ls",
    enable = true,
    config = function(on_attach, capabilities)
      lspconfig.ltex.setup({
        filetypes = { "markdown", "text", "gitcommit" },
        flags = { debounce_text_changes = 500 },
        settings = {
          ltex = {
            language = "auto",
          },
        },
        on_attach,
        capabilities,
      })
    end
  },
  {
    package_name = 'teal-language-server',
    enable = true,
    config = function(on_attach, capabilities)
      lspconfig.teal_ls.setup({
        on_attach,
        capabilities
      })
    end
  },
  {
    package_name = nil,
    enable = true,
    config = function(on_attach, capabilities)
      lspconfig.metals.setup({
        root_dir = util.root_pattern("build.sbt", "build.sc", "build.gradle", "pom.xml", "*.scala"),
        on_attach,
        capabilities,
      })
    end
  },
  {
    package_name = 'jdtls',
    enable = true,
    config = function(on_attach, capabilities)
      lspconfig.jdtls.setup({
        on_attach,
        capabilities,
      })
    end
  },
  {
    package_name = 'deno',
    enable = true,
    config = function(on_attach, capabilities)
      lspconfig.denols.setup({
        root_dir = util.root_pattern('deno.json'),
        on_attach,
        capabilities
      })
    end
  },
  {
    package_name = 'intelephense',
    enable = true,
    config = function(on_attach, capabilities)
      lspconfig.intelephense.setup({
        on_attach,
        capabilities
      })
    end
  },
  {
    package_name = 'bash-language-server',
    enable = true,
    config = function(on_attach, capabilities)
      lspconfig.bashls.setup({
        on_attach,
        capabilities
      })
    end
  },
  {
    package_name = 'html-lsp',
    enable = true,
    config = function(on_attach, capabilities)
      lspconfig.html.setup({
        on_attach,
        capabilities
      })
    end
  },
  {
    package_name = 'haskell-language-server',
    enable = false,
    config = function(on_attach, capabilities)
      lspconfig.hls.setup({
        on_attach,
        capabilities
      })
    end
  },
  {
    package_name = 'rust-analyzer',
    enable = true,
    config = function(on_attach, capabilities)
      lspconfig.rust_analyzer.setup({
        on_attach,
        capabilities
      })
    end
  },
  {
    package_name = 'yaml-language-server',
    enable = true,
    config = function(on_attach, capabilities)
      lspconfig.yamlls.setup({
        on_attach,
        capabilities,
        settings = {
          yaml = {
            schemas = {
              ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
              ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "/docker-compose.*"
            },
          },
        }
      })
    end
  },
  {
    package_name = 'typescript-language-server',
    enable = false,
    config = function(on_attach, capabilities)
      lspconfig.tsserver.setup({
        root_dir = util.root_pattern('package.json'),
        filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", 'vue' },
        preferences = {
          quotePreference = 'single',
          importModuleSpecifierPreference = 'relative',
          includeCompletionsForImportStatements = true
        },
        on_attach,
        capabilities,
      })
    end
  },
  {
    package_name = 'vim-language-server',
    enable = true,
    config = function(on_attach, capabilities)
      lspconfig.vimls.setup({
        on_attach,
        capabilities
      })
    end
  },
  {
    package_name = 'eslint-lsp',
    enable = true,
    config = function(on_attach, capabilities)
      lspconfig.eslint.setup({
        root_dir = util.root_pattern(".eslintrc.js", ".eslintrc.cjs", ".eslintrc.yaml", ".eslintrc.yml", ".eslintrc.json", ".eslintrc"),
        on_attach,
        capabilities
      })
    end
  },
  {
    package_name = 'json-lsp',
    enable = true,
    config = function(on_attach, capabilities)
      local _, schemastore = pcall(require, 'schemastore')

      lspconfig.jsonls.setup({
        on_attach,
        capabilities,
        settings = {
          json = {
            schemas = schemastore.json.schemas({
              select = {
                '.eslintrc',
                'package.json',
                'tsconfig.json',
                'tslint.json',
              },
            }
            ),
            validate = { enable = true }
          }
        }
      })
    end,
  },
  {
    package_name = 'lua-language-server',
    enable = true,
    config = function(on_attach, capabilities)
      lspconfig.lua_ls.setup({
        on_attach,
        capabilities,
        settings = {
          Lua = {
            completion = {
              callSnippet = "Replace"
            },
            diagnostics = {
              globals = { 'vim' },
            },
          }
        }
      })
    end
  },
  {
    package_name = 'pyright',
    enable = true,
    config = function(on_attach, capabilities)
      lspconfig.pyright.setup({
        on_attach,
        capabilities
      })
    end
  },
  {
    package_name = 'sqlls',
    enable = true,
    config = function(on_attach, capabilities)
      lspconfig.sqlls.setup({
        on_attach,
        capabilities
      })
    end
  },
  {
    package_name = 'css-lsp',
    enable = true,
    config = function(on_attach, capabilities)
      lspconfig.cssls.setup({
        on_attach,
        capabilities
      })
    end
  },
  {
    package_name = 'zls',
    enable = true,
    config = function(on_attach, capabilities)
      lspconfig.zls.setup({
        on_attach,
        capabilities
      })
    end
  },
  {
    package_name = 'diagnostic-languageserver',
    enable = true,
    config = function(on_attach, capabilities)
      lspconfig.diagnosticls.setup({
        on_attach,
        capabilities
      })
    end
  },
  {
    package_name = 'cmake-language-server',
    enable = true,
    config = function(on_attach, capabilities)
      lspconfig.cmake.setup({
        on_attach,
        capabilities
      })
    end
  },
  {
    package_name = 'dockerfile-language-server',
    enable = true,
    config = function(on_attach, capabilities)
      lspconfig.dockerls.setup({
        on_attach,
        capabilities
      })
    end
  },
  {
    package_name = 'emmet-ls',
    enable = false,
    config = function(on_attach, capabilities)
      lspconfig.emmet_ls.setup({
        filetypes = {
          "css",
          "eruby",
          "html",
          "javascript",
          "javascriptreact",
          "less",
          "sass",
          "scss",
          "svelte",
          "pug",
          "typescriptreact",
          "vue",
          "rust",
        },
        init_options = {
          userLanguages = {
            rust = "html",
          },
        },
        on_attach,
        capabilities
      })
    end
  },
  {
    package_name = 'gopls',
    enable = true,
    config = function(on_attach, capabilities)
      lspconfig.gopls.setup({
        on_attach,
        capabilities
      })
    end
  },
  {
    package_name = 'taplo',
    enable = true,
    config = function(on_attach, capabilities)
      lspconfig.taplo.setup({
        on_attach,
        capabilities
      })
    end
  },
  {
    package_name = "omnisharp",
    enable = true,
    config = function(on_attach, capabilities)
      local pid = vim.fn.getpid()
      lspconfig.omnisharp.setup({
        cmd = { 'omnisharp', '--languageserver', '--hostPID', tostring(pid) },
        on_attach,
        capabilities,
      })
    end
  }
}
