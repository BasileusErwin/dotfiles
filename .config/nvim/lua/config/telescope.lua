local M = {}

M.keymaps = function ()
  local status_ok, whichkey = pcall(require, 'which-key')

  if not status_ok then
    return
  end

  local keymaps = {
    f = {
      name = 'Find',
      g = { '<cmd>lua require("telescope.builtin").live_grep()<CR>',  'Live Grep'},
      f = { '<cmd>lua require("telescope.builtin").find_files()<CR>',  'Find files'},
      b = { '<cmd>lua require("telescope.builtin").buffers()<CR>',  'Find in buffer'},
    },
  }

  whichkey.register(keymaps, {
    prefix = '<leader>',
    silent = true,
    noremap = true,
    nowait = false,
  })
end

M.setup = function ()
  local status_ok, telescope = pcall(require, 'telescope')
  if not status_ok then
    return
  end

  local actions = require('telescope.actions')
  local previewers = require('telescope.previewers')

  telescope.setup({
    defaults = {
      layout_config = {
        width = 0.75,
        prompt_position = 'top',
        preview_cutoff = 120,
        horizontal = {
          mirror = false
        },
        vertical = {
          mirror = false
        }
      },
      pickers = {
        find_files = {
          find_command = { "fd", "--type", "f", "--strip-cwd-prefix" }
        },
      },
      prompt_prefix = ' ',
      selection_caret = ' ',
      entry_prefix = '  ',
      initial_mode = 'insert',
      selection_strategy = 'reset',
      sorting_strategy = 'descending',
      layout_strategy = 'horizontal',
      file_sorter = require 'telescope.sorters'.get_fuzzy_file,
      file_ignore_patterns = {},
      generic_sorter = require 'telescope.sorters'.get_generic_fuzzy_sorter,
      path_display = {},
      winblend = 0,
      border = {},
      borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
      color_devicons = true,
      use_less = true,
      set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
      file_previewer = previewers.vim_buffer_cat.new,
      grep_previewer = previewers.vim_buffer_vimgrep.new,
      qflist_previewer = previewers.vim_buffer_qflist.new,
      buffer_previewer_maker = previewers.buffer_previewer_maker,
      extensions = {
        ['ui-select'] = {},
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case"
        }
      },
      mappings = {
        i = {
          ['<C-n>'] = actions.cycle_history_next,
          ['<C-p>'] = actions.cycle_history_prev,

          ['<C-j>'] = actions.move_selection_next,
          ['<C-k>'] = actions.move_selection_previous,

          ['<M-q>'] = actions.close,

          ['<Down>'] = actions.move_selection_next,
          ['<Up>'] = actions.move_selection_previous,

          ['<CR>'] = actions.select_default,
          ['<C-x>'] = actions.select_horizontal,
          ['<C-v>'] = actions.select_vertical,
          ['<C-t>'] = actions.select_tab,

          ['<C-u>'] = actions.preview_scrolling_up,
          ['<C-d>'] = actions.preview_scrolling_down,

          ['<PageUp>'] = actions.results_scrolling_up,
          ['<PageDown>'] = actions.results_scrolling_down,

          ['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
          ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,
          ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
          ['<C-l>'] = actions.complete_tag,
          ['<C-_>'] = actions.which_key, -- keys from pressing <C-/>
        },
        n = {
          ['<esc>'] = actions.close,

          ['<M-q>'] = actions.close,

          ['<CR>'] = actions.select_default,
          ['<C-x>'] = actions.select_horizontal,
          ['<C-v>'] = actions.select_vertical,
          ['<C-t>'] = actions.select_tab,

          ['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
          ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,
          ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,

          ['j'] = actions.move_selection_next,
          ['k'] = actions.move_selection_previous,
          ['H'] = actions.move_to_top,
          ['M'] = actions.move_to_middle,
          ['L'] = actions.move_to_bottom,

          ['<Down>'] = actions.move_selection_next,
          ['<Up>'] = actions.move_selection_previous,
          ['gg'] = actions.move_to_top,
          ['G'] = actions.move_to_bottom,

          ['<C-u>'] = actions.preview_scrolling_up,
          ['<C-d>'] = actions.preview_scrolling_down,

          ['<PageUp>'] = actions.results_scrolling_up,
          ['<PageDown>'] = actions.results_scrolling_down,

          ['?'] = actions.which_key,
        },
      },
    },
  })

  telescope.load_extension('fzf')
  telescope.load_extension('ui-select')
  telescope.load_extension('file_browser')

  M.keymaps()
end

return M
