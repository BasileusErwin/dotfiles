local M = {}

M.opts = {
  mode = 'n', -- Normal mode
  prefix = '<leader>',
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

M.v_opts = {
  mode = "v", -- Visual mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

M.code_keymap = function(whichkey)
  vim.cmd 'autocmd FileType * lua CodeRunner()'

  function CodeRunner()
    local bufnr = vim.api.nvim_get_current_buf()
    local ft = vim.api.nvim_buf_get_option(bufnr, 'filetype')
    local keymap = nil
    if ft == 'rust' then
      keymap = {
        name = 'Rust',
        a = {
          ':RustHoverActions<CR>',
          'Hover Actions'
        },
        r = {
          ':lua require("rust-tools.runnables").runnables()<CR>',
          'Runnables'
        },
        c = {
          ':lua require("rust-tools.open_cargo_toml").open_cargo_toml()<CR>',
          'Open cargo'
        },
        e = {
          ':lua require("rust-tools.expand_macro").expand_macro()<CR>',
          'Expand Macro'
        }
      }
    elseif ft == 'go' then
      keymap = {
        name = 'Code',
        r = { '<cmd>GoRun<cr>', 'Run' },
      }
    elseif ft == 'jdtls' then
      keymap = {
        name = 'Code',
        o = { '<cmd>lua require("jdtls").organize_imports()<CR>', 'Sort Imports' },
        u = { '<cmd>JdtUpdateConfig<CR>', 'Update Config' }
      }
    end

    if keymap ~= nil then
      whichkey.register(
        { l = keymap },
        { mode = 'n', silent = true, noremap = true, buffer = bufnr, prefix = '<leader>' }
      )
    end
  end
end

M.setup = function(_, conf)
  local status_ok, whichkey = pcall(require, 'which-key')

  if not status_ok then
    return
  end

  local mappings = {
    ['w'] = { '<cmd>update!<CR>', 'Save' },
    ['q'] = { '<cmd>q!<CR>', 'Quit' },

    b = {
      name = 'Buffer',
      b = { '<Cmd>BufferLineSortByTab<CR>', 'Sort buffer by buffer number' },
      d = { '<Cmd>BufferLineSortByDirectory<CR>', 'Sort buffer by directory' },
      r = { '<Cmd>BufferLineSortByRelativeDirectory<CR>', 'Sort buffer by relative directory' },
      l = { '<Cmd>BufferLineSortByExtension<CR>', 'Sort buffer by extension' },
      w = { '<Cmd>BufferLineSortByWindowNumber<CR>', 'Sort buffer by Window Number' },
    },

    e = {
      '<cmd>NvimTreeFindFileToggle<CR>',
      'Explorer',
    },

    t = {
      name = 'Terminal',
      h = { '<cmd>ToggleTerm size=15 direction=horizontal<CR>', 'Open Horizontal' },
      f = { '<cmd>ToggleTerm size=15 direction=float<CR>', 'Open Float' }
    },

    o = { ':SymbolsOutline<CR>', 'Symbols Outline' },

    i = {
      name = 'Notes Obsidian',
      s = { '<cmd>ObsidianSearch<CR>', 'Grep notes' },
      n = { '<cmd>ObsidianNew<CR>', 'New note' },
      t = { '<cmd>ObsidianToday<CR>', 'Today note' },
      f = { '<cmd>ObsidianQuickSwitch<CR>', 'Search file note' },
    },

    f = {
      name = 'Find',
      g = { '<cmd>lua require("telescope.builtin").live_grep()<CR>', 'Live Grep' },
      f = { '<cmd>lua require("telescope.builtin").find_files()<CR>', 'Find files' },
      b = { '<cmd>lua require("telescope.builtin").buffers()<CR>', 'Find in buffer' },
    },
  }

  local visual_keymap = {
    g = {
      name = "Git",
      y = {
        "<cmd>lua require'gitlinker'.get_buf_range_url('v', {action_callback = require'gitlinker.actions'.open_in_browser})<cr>",
        "Link",
      },
    },

    r = {
      name = "Refactor",
      e = { [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]], "Extract Function" },
      f = {
        [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function to File')<CR>]],
        "Extract Function to File",
      },
      v = { [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]], "Extract Variable" },
      i = { [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], "Inline Variable" },
      r = { [[ <Esc><Cmd>lua require('telescope').extensions.refactoring.refactors()<CR>]], "Refactor" },
      V = { [[ <Esc><Cmd>lua require('refactoring').debug.print_var({})<CR>]], "Debug Print Var" },
    },
  }

  whichkey.setup(conf)
  whichkey.register(mappings, M.opts)
  whichkey.register(visual_keymap, M.v_opts)
  M.code_keymap(whichkey)
end

return M
