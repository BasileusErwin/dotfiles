return {
  "akinsho/bufferline.nvim",
  event = "BufReadPre",
  keys = {
    { "<S-TAB>", "<Cmd>BufferLineCyclePrev<CR>", mode = "n" },
    { "<TAB>",   "<Cmd>BufferLineCycleNext<CR>", mode = "n" },
  },
  opts = {
    options = {
      numbers = "none",
      diagnostics = "nvim_lsp",
      separator_style = "slant" or "padded_slant",
      show_tab_indicators = true,
      show_buffer_close_icons = false,
      show_close_icon = false,
    },
  },
}
