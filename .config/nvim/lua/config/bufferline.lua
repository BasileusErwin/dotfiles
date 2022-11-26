local M = {}

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

M.setup = function()
  local status_ok, bufferline = pcall(require, "bufferline")

  if not status_ok then
    return
  end

  bufferline.setup({
    options = {
      numbers = "none",
      diagnostics = "nvim_lsp",
      separator_style = "slant" or "padded_slant",
      show_tab_indicators = true,
      show_buffer_close_icons = false,
      show_close_icon = false,
    },
  })

  map('n', '<S-TAB>', '<Cmd>BufferLineCyclePrev<CR>', opts)
  map('n', '<TAB>', '<Cmd>BufferLineCycleNext<CR>', opts)
end

return M
