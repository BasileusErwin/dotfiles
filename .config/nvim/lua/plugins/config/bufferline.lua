local M = {}

M.setup = function()
  local status_ok, dbufferline = pcall(require, "bufferline")
  if not status_ok then
    return
  end

  local bufferline = require('bufferline')

  bufferline.setup({
    active = true,
    options = {
      numbers = "none",
      close_command = "Bdelete! %d",
      right_mouse_command = "Bdelete! %d",
      left_mouse_command = "buffer %d",
      middle_mouse_command = nil,
      indicator_icon = "▎",
      buffer_close_icon = "",
      modified_icon = "●",
      close_icon = "",
      left_trunc_marker = "",
      right_trunc_marker = "",
      max_name_length = 30,
      max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
      tab_size = 21,
      diagnostics = "nvim_lsp", -- | "nvim_lsp" | "coc",
      diagnostics_update_in_insert = false,
      offsets = { { filetype = "NvimTree", text = "", padding = 0 } },
      show_buffer_icons = true,
      show_buffer_close_icons = true,
      show_close_icon = true,
      show_tab_indicators = true,
      persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
      separator_style = "thin", -- | "thick" | "thin" | { 'any', 'any' },
      enforce_regular_tabs = false,
      always_show_bufferline = true,
    },
  })
end

return M
