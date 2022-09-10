local M = {}
local o = vim.o
local cmd = vim.cmd
local map = vim.api.nvim_set_keymap
local keymap = vim.keymap

M.setup = function()
  local status_ok, toggleterm = pcall(require, "toggleterm")

  if not status_ok then
    return
  end

  toggleterm.setup({
    -- size can be a number or function which is passed the current terminal
    size = 15,
    open_mapping = [[<M-t>]],
    hide_numbers = true, -- hide the number column in toggleterm buffers
    shade_filetypes = {},
    shade_terminals = true, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
    start_in_insert = true,
    insert_mappings = true, -- whether or not the open mapping applies in insert mode
    terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
    persist_size = true,
    persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
    direction = 'horizontal',
    close_on_exit = true, -- close the terminal window when the process exits
    shell = o.shell, -- change the default shell
    auto_scroll = true, -- automatically scroll to the bottom on terminal output
    -- This field is only relevant if direction is set to 'float'
    float_opts = {
      -- The border key is *almost* the same as 'nvim_open_win'
      -- see :h nvim_open_win for details on borders however
      -- the 'curved' border is a custom border type
      -- not natively supported but implemented in this plugin.
      border = 'single',
      winblend = 3,
    },
    winbar = {
      enabled = false,
      name_formatter = function(term) --  term: Terminal
        return term.name
      end
    },
  })

  function _G.set_terminal_keymaps()
    local opts = { buffer = 0 }
    keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
    keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
    keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
    keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
    keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
    keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  end

  -- if you only want these mappings for toggle term use term://*toggleterm#* instead
  cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

  map('n', '<Leader>th', ":ToggleTerm size=15 direction=horizontal<CR>", { noremap = true, silent = true })
  map('n', '<Leader>tf', ":ToggleTerm size=40 direction=float<CR>", { noremap = true, silent = true })
end

return M
