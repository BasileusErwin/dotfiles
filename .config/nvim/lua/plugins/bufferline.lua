return {
  "akinsho/bufferline.nvim",
  event = "BufReadPre",
  keys = {
    { "<S-TAB>", "<Cmd>BufferLineCyclePrev<CR>", mode = "n" },
    { "<TAB>",   "<Cmd>BufferLineCycleNext<CR>", mode = "n" },
  },
  opts = {
    options = {
      offsets = {
        {
          filetype = "NvimTree",
          text = " File Explorer",
          highlight = "Directory",
          text_align = "center",
          separator = true
        }
      },
      numbers = "none",
      diagnostics = "nvim_lsp",
      separator_style = "thin",
      show_tab_indicators = true,
      show_buffer_close_icons = false,
      show_close_icon = false,
      color_icons = true,
    },
  },
}
