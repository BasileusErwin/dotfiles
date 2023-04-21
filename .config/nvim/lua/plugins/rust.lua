local on_attach = require('config.lsp').on_attach
return {
  'simrat39/rust-tools.nvim',
  name = 'rust-tools',
  ft = { 'rust' },
  dependencies = {
    "mfussenegger/nvim-dap",
    'nvim-lua/plenary.nvim',
    'rust-lang/rust.vim',
    'ron-rs/ron.vim',
  },
  opts = {
    tools = {
      autoSetHints = true,
      inlay_hints = {
        auto = true,
        show_parameter_hints = true,
        only_current_line = false,
        parameter_hints_prefix = "<- ",
        other_hints_prefix = "=> ",
        max_len_align = false,
        max_len_align_padding = 1,
        right_align = false,
        right_align_padding = 7,
        highlight = "Comment",
      },
    },
    hover_actions = {
      border = {
        { "╭", "FloatBorder" },
        { "─", "FloatBorder" },
        { "╮", "FloatBorder" },
        { "│", "FloatBorder" },
        { "╯", "FloatBorder" },
        { "─", "FloatBorder" },
        { "╰", "FloatBorder" },
        { "│", "FloatBorder" },
      },
      auto_focus = true,
    },
    server = {
      path = vim.fn.stdpath("data") .. "/lsp_servers/rust/rust-analyzer",
      on_attach = on_attach,
      settings = {
        ["rust-analyzer"] = {
          checkOnSave = {
            command = "clippy"
          },
        },
        assist = {
          importGranularity = "module",
          importPrefix = "by_self",
        },
        cargo = {
          loadOutDirsFromCheck = true,
        },
        procMacro = {
          enable = true,
          enabled = true,
        },
        procMacros = {
          enable = true,
          enabled = true,
        },
        imports = {
          prefix = "self",
        },
        inlayHints = {
          render_colons = true,
          type_hints = true,
          parameter_hints = true,
          chaining_hints = true,
          hide_closure_initialization_hints = false,
          adjustment_hints = {
            enable = "always",
          },
          discriminant_hints = {
            enable = "always",
          },
          lifetimeElisionHints = {
            enable = "always",
            useParemeterNames = true,
          },
          closureReturnTypeHints = {
            enable = "always",
          },
          discriminantHints = {
            enable = "fieldless",
          },
          bindingModeHints = {
            enable = true,
          },
        },
        lens = {
          run = true,
          enable = true,
          implementations = {
            enable = true,
          },
          method_refs = {
            enable = true,
          },
          references = {
            adt = {
              enable = true,
            },
            enumVariant = {
              enable = true,
            },
            method = {
              enable = true,
            },
            trait = {
              enable = true,
            },
          },
        },
      }
    },
  },
  config = function(_, opts)
    local rust_tools = require('rust-tools')

    vim.cmd([[
      let g:rust_recommended_style = 0
      let g:rust_clip_command = 'xclip -selection clipboard'
    ]])

    rust_tools.setup(opts)

    rust_tools.inlay_hints.set()
    rust_tools.inlay_hints.enable()
  end
}
