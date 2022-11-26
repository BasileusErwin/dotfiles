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
        name = 'Code',
        r = { '<cmd>Cargo run<cr>', 'Run' },
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
        { c = keymap },
        { mode = 'n', silent = true, noremap = true, buffer = bufnr, prefix = '<leader>' }
      )
    end
  end
end

M.setup = function()
  local status_ok, whichkey = pcall(require, 'which-key')

  if not status_ok then
    return
  end

  local conf = {
    window = {
      border = 'single', -- none, single, double, shadow
      position = 'bottom', -- bottom, top
    },
  }

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

    p = {
      name = 'Packer',
      c = { '<cmd>PackerCompile<CR>', 'Compile' },
      i = { '<cmd>PackerInstall<CR>', 'Install' },
      s = { '<cmd>PackerSync<CR>', 'Sync' },
      S = { '<cmd>PackerStatus<CR>', 'Status' },
      u = { '<cmd>PackerUpdate<CR>', 'Update' },
      p = { '<cmd>PackerProfile<CR>', 'Promise' },
    },

    e = {
      '<cmd>NvimTreeFindFileToggle<CR>',
      'Explorer',
    },

    c = {
      name = 'Code',
      g = { '<cmd>Neogen func<CR>', 'Function Doc' },
      G = { '<cmd>Neogen class<CR>', 'Class Doc' },
    },

    t = {
      name = 'Terminal',
      h = { '<cmd>ToggleTerm size=15 direction=horizontal<CR>', 'Open Horizontal'},
      f = { '<cmd>ToggleTerm size=15 direction=float<CR>', 'Open Float' }
    }
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
