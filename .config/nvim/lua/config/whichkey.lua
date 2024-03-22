local M = {}

M.opts = {
  mode = 'n',     -- Normal mode
  prefix = '<leader>',
  buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true,  -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

M.v_opts = {
  mode = "v",     -- Visual mode
  prefix = "<leader>",
  buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true,  -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

M.code_keymap = function(whichkey)
  vim.cmd 'autocmd FileType * lua CodeRunner()'

  function CodeRunner()
    local bufnr = vim.api.nvim_get_current_buf()
    local file_type = vim.api.nvim_buf_get_option(bufnr, 'filetype')
    local keymap = nil
    local visual_keymap = nil

    if file_type == 'http' then
      keymap = {
        name = 'HTTP Client',
        r = {
          '<Plug>RestNvim<CR>',
          'Run the request under the cursor',
        },
        p = {
          '<Plug>RestNivmPreview<CR>',
          'Preview the request cURL command',
        },
        l = {
          '<Plug>RestNvimLast<CR>',
          'Re-run the last request',
        },
      }

      whichkey.register(
        { l = keymap },
        {
          mode = "v",     -- Visual mode
          prefix = "<leader>",
          buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
          silent = true,  -- use `silent` when creating keymaps
          noremap = true, -- use `noremap` when creating keymaps
          nowait = false, -- use `nowait` when creating keymaps
        }
      )
    elseif file_type == 'rust' then
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
    elseif file_type == 'jdtls' then
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
    elseif visual_keymap ~= nil then
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

  local visual_keymap = {}

  whichkey.setup(conf)
  whichkey.register(mappings, M.opts)
  whichkey.register(visual_keymap, M.v_opts)
  M.code_keymap(whichkey)
end

return M
