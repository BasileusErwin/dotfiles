local M = {}

M.setup = function()
  vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
  vim.g.indent_blankline_filetype_exclude = {
    "help",
    "startify",
    "dashboard",
    "packer",
    "neogitstatus",
    "NvimTree",
    "Trouble",
    "text"
  }
  vim.g.indentLine_enabled = 1
  vim.g.indent_blankline_char = "▏"

  vim.g.indent_blankline_show_trailing_blankline_indent = false
  vim.g.indent_blankline_show_first_indent_level = true
  vim.g.indent_blankline_use_treesitter = false
  vim.g.indent_blankline_show_current_context = true
  --
  -- vim.g.indentLine_enabled = 1
  -- vim.g.indent_blankline_char = ""
  -- vim.g.indent_blankline_filetype_exclude = { "help", "terminal", "dashboard" }
  -- vim.g.indent_blankline_buftype_exclude = { "terminal" }
  -- vim.g.indent_blankline_show_trailing_blankline_indent = false
  -- vim.g.indent_blankline_show_first_indent_level = false

  vim.opt.list = true
  vim.opt.listchars:append("space:⋅")
end

return M
