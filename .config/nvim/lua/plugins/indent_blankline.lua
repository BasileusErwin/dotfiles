return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    char = "│",
    filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
    show_end_of_line = true,
    show_trailing_blankline_indent = false,
    show_first_indent_level = true,
    use_treesitter = false,
    show_current_context = true,
    enabled = true,
    buftype_exclude = { "terminal", "nofile" },
  },
  config = function()
    vim.opt.list = true
    vim.opt.listchars:append("space:⋅")
  end,
}
