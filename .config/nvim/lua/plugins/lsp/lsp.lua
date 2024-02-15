return {
  'neovim/nvim-lspconfig',
  event = 'VeryLazy',
  config = function()
    require('config.lsp').setup()
  end,
  dependencies = {
    'lvimuser/lsp-inlayhints.nvim',
    {
      "nvimtools/none-ls.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      name = 'null-ls'
    },
    {
      'stevearc/conform.nvim',
      opts = {
        formatters_by_ft = {
          nasm       = { "asmfmt" },
          asm        = { "asmfmt" },
          c          = { "clang-format" },
          cpp        = { "clang-format" },
          cmake      = { "cmake-format" },
          make       = { "cmake-format" },
          lua        = { "stylua" },
          python     = { "isort", "black" },
          javascript = { { "prettierd", "prettier" } },
          typescript = { { "prettierd", "prettier" } },
          rust       = { "rustfmt" },
          json       = { { "prettierd", "jq" } },
          ocaml      = { "ocamlformat" },
          zig        = { "zigfmt" },
          bash       = { "shellcheck" },
          ["_"]      = { "trim_whitespace" },
        },
        formatters = {
          ["clang-format"] = { }
        }
      },
      config = function(_, opts)
        opts.formatters['clang-format'] = {
            command = "clang-format",
            cwd = require("conform.util").root_file({ ".clang-format" })
        }

        require("conform").setup(opts)
      end,
    },
    {
      'williamboman/mason.nvim',
      event = 'VeryLazy',
      dependencies = {
        'williamboman/mason-lspconfig.nvim',
        {
          'WhoIsSethDaniel/mason-tool-installer.nvim',
          event = 'VeryLazy',
        },
      },
      opts = {
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      },
    },
    {
      'ray-x/lsp_signature.nvim',
      opts = {
        bind = true,
        max_height = 10,        -- max height of signature floating_window
        max_width = 70,         -- max_width of signature floating_window
        noice = true,           -- set to true if you using noice to render markdown
        wrap = true,            -- allow doc/signature text wrap inside floating_window, useful if your lsp return doc/sig is too long

        floating_window = true, -- show hint in a floating window, set to false for virtual text only mode
      }
    },
    {
      "folke/trouble.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      opts = {
        position = "bottom", -- position of the list can be: bottom, top, left, right
        height = 10, -- height of the trouble list when position is top or bottom
        width = 50, -- width of the list when position is left or right
        icons = true, -- use devicons for filenames
        mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
        severity = nil, -- nil (ALL) or vim.diagnostic.severity.ERROR | WARN | INFO | HINT
        fold_open = "", -- icon used for open folds
        fold_closed = "", -- icon used for closed folds
        group = true, -- group results by file
        padding = true, -- add an extra new line on top of the list
        action_keys = {
          -- key mappings for actions in the trouble list
          -- map to {} to remove a mapping, for example:
          -- close = {},
          close = "q",                     -- close the list
          cancel = "<esc>",                -- cancel the preview and get back to your last window / buffer / cursor
          refresh = "r",                   -- manually refresh
          jump = { "<cr>", "<tab>" },      -- jump to the diagnostic or open / close folds
          open_split = { "<c-x>" },        -- open buffer in new split
          open_vsplit = { "<c-v>" },       -- open buffer in new vsplit
          open_tab = { "<c-t>" },          -- open buffer in new tab
          jump_close = { "o" },            -- jump to the diagnostic and close the list
          toggle_mode = "m",               -- toggle between "workspace" and "document" diagnostics mode
          switch_severity = "s",           -- switch "diagnostics" severity filter level to HINT / INFO / WARN / ERROR
          toggle_preview = "P",            -- toggle auto_preview
          hover = "K",                     -- opens a small popup with the full multiline message
          preview = "p",                   -- preview the diagnostic location
          close_folds = { "zM", "zm" },    -- close all folds
          open_folds = { "zR", "zr" },     -- open all folds
          toggle_fold = { "zA", "za" },    -- toggle fold of current file
          previous = "k",                  -- previous item
          next = "j"                       -- next item
        },
        indent_lines = true,               -- add an indent guide below the fold icons
        auto_open = false,                 -- automatically open the list when you have diagnostics
        auto_close = false,                -- automatically close the list when you have no diagnostics
        auto_preview = true,               -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
        auto_fold = false,                 -- automatically fold a file trouble list at creation
        auto_jump = { "lsp_definitions" }, -- for the given modes, automatically jump if there is only a single result
        signs = {
          -- icons / text used for a diagnostic
          error = "",
          warning = "",
          hint = "",
          information = "",
          other = "﫠"
        },
        use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
      },
    },
    'b0o/schemastore.nvim',
    { 'folke/lsp-colors.nvim' },
    'SmiteshP/nvim-navic',
    {
      "j-hui/fidget.nvim",
      enabled = false,
      opts = {
        text = {
          spinner = "dots"
        },
        window = {
          blend = 100,
          reative = "editor",
        },
        fmt = {
          leftpad = true,
          stack_upwards = true,
          max_width = 0,
          -- task = function () end,
        },
        sources = {
          ["null-ls"] = {
            ignore = true,
          },
          ['diagnostics'] = {
            ignore = true
          }
        },
      },
    }
  }
}
