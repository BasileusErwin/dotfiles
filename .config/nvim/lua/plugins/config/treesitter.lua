local treesitter_config = require'nvim-treesitter.configs'

local config = {
	ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false,
	highlight = {
    enable = true,
    -- use_languagetree = true,
  },
  matchup = {
    enable = true
  },
  indent = {
    enable = true,
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
    },
  },
  refactor = {
    highlight_definitions = { enable = true },
    highlight_current_scope = { enable = false },
  },
  playground = {
      enable = false,
      disable = {},
      updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
      persist_queries = false, -- Whether the query persists across vim sessions
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
      extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
      max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
    },
  }


treesitter_config.setup(vim.tbl_deep_extend('force', config, {}))

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.used_by = { "javascript", "javascript.jsx","typescript.tsx" }
