local M = {}

M.setup = function()
  local _, treesitter_config = pcall(require, 'nvim-treesitter.configs')

  local config = {
    ensure_installed = "all",
    sync_install = false,
    highlight = {
      enable = true,
      use_languagetree = true,
      additional_vim_regex_highlighting = { "markdown" },
    },
    tree_docs = {
      enable = true,
      spec_config = {
        jsdoc = {
          slots = {
            class = { author = true }
          }
        }
      }
    },
    autotag = {
      enable = true,
    },
    context_commentstring = {
      enable = true,
      config = {
        typescript = "// %s",
        css = "/* %s */",
        scss = "/* %s */",
        html = "<!-- %s -->",
        lua = '-- %s',
        bash = '# %s'
      },
    },
    refactor = {
      highlight_definitions = { enable = true },
      highlight_current_scope = { enable = false },
    },
    playground = {
      enable = false,
      disable = {},
      updatetime = 25,           -- Debounced time for highlighting nodes in the playground from source code
      persist_queries = false,   -- Whether the query persists across vim sessions
      keybindings = {
        toggle_query_editor = "o",
        toggle_hl_groups = "i",
        toggle_injected_languages = "t",
        toggle_anonymous_nodes = "a",
        toggle_language_display = "I",
        focus_language = "f",
        unfocus_language = "F",
        update = "R",
        goto_node = "<cr>",
        show_help = "?",
      },
    },
    rainbow = {
      enable = true,
      extended_mode = true,    -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
      max_file_lines = 1000,   -- Do not enable for files with more than 1000 lines, int
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
      },
    },
    indent = { enable = true },
    -- vim-matchup
    matchup = {
      enable = true,
    },
  }


  treesitter_config.setup(config)

  local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

  parser_config.ignis = {
    install_info = {
      url = "/home/iperez/Workspace/Ignis/tree-sitter-ignis",
      files = {"src/parser.c"},
    },
    filetype = "ign",
  }

  parser_config.tsx.filetype_to_parsername = { "javascript", "javascript.jsx", "typescript.tsx" }
end

return M
