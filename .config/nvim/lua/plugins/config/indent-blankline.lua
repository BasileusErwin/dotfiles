local status_ok, indent_blankline = pcall(require, 'indent_blankline')
if not status_ok then
  return
end

vim.g.indentLine_enabled = 1
vim.g.indent_blankline_char = ""
vim.g.indent_blankline_filetype_exclude = { "help", "terminal", "dashboard" }
vim.g.indent_blankline_buftype_exclude = { "terminal" }
vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_show_first_indent_level = false

vim.opt.list = true
vim.opt.listchars:append("space:⋅")

indent_blankline.setup {
  show_end_of_line = true,
}
