local saga = require 'lspsaga'
local map = vim.api.nvim_set_keymap

saga.init_lsp_saga {
  error_sign = '',
  warn_sign = '',
  hint_sign = '',
  infor_sign = '',
  border_style = "round",
}

map('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', {noremap = true})
map('n', '<C-j>', '<Cmd>Lspsaga hover_doc<CR>', {noremap = true})
map('i', '<C-j>', '<Cmd>Lspsaga signature_help<CR>', {noremap = true})
map('n', '<C-j>', '<Cmd>Lspsaga lsp_finder<CR>', {noremap = true})
