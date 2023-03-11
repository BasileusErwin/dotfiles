return {
  "akinsho/toggleterm.nvim",
  opts = {
    -- size can be a number or function which is passed the current terminal
    size = 15,
    open_mapping = [[<M-t>]],
    hide_numbers = true,      -- hide the number column in toggleterm buffers
    shade_filetypes = {},
    shade_terminals = true,   -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
    start_in_insert = true,
    insert_mappings = true,   -- whether or not the open mapping applies in insert mode
    terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
    persist_size = true,
    persist_mode = true,      -- if set to true (default) the previous terminal mode will be remembered
    direction = 'horizontal',
    close_on_exit = true,     -- close the terminal window when the process exits
    shell = vim.o.shell,      -- change the default shell
    auto_scroll = true,       -- automatically scroll to the bottom on terminal output
    float_opts = {
      border = 'single',
      winblend = 3,
    },
    winbar = {
      enabled = false,
      name_formatter = function(term) --  term: Terminal
        return term.name
      end
    },
  },
  config = function(_, opts)
    local toggleterm = require("toggleterm")
    toggleterm.setup(opts)

    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }
      vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
      vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
      vim.keymap.set('t', 'jj', [[<C-\><C-n>]], opts)
      vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
      vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
      vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
      vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
    end

    -- if you only want these mappings for toggle term use term://*toggleterm#* instead
    vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
  end
}
