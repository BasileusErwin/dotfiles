local M = {}

M.setup = function()
  local status, symbols_outline = pcall(require, "symbols-outline")

  if not status then
    return
  end

  symbols_outline.setup(
    {
      highlight_hovered_item = false,
      show_guides = true,
      auto_preview = false,
      position = 'right',
      relative_width = true,
      width = 25,
      auto_close = false,
      show_numbers = false,
      show_relative_numbers = false,
      show_symbol_details = true,
      preview_bg_highlight = 'Pmenu',
      keymaps = { -- These keymaps can be a string or a table for multiple keys
        close = { "<Esc>", "q" },
        goto_location = "<Cr>",
        focus_location = "o",
        hover_symbol = "<C-space>",
        toggle_preview = "K",
        rename_symbol = "r",
        code_actions = "a",
      },
      lsp_blacklist = {},
      symbol_blacklist = {},
      symbols = {
        File = { icon = "", hl = "TSURI" },
        Module = { icon = "", hl = "TSNamespace" },
        Namespace = { icon = "", hl = "TSNamespace" },
        Package = { icon = "", hl = "TSNamespace" },
        Class = { icon = "ﴯ", hl = "TSType" },
        Method = { icon = "", hl = "TSMethod" },
        Property = { icon = "", hl = "TSMethod" },
        Field = { icon = "ﰠ", hl = "TSField" },
        Constructor = { icon = "", hl = "TSConstructor" },
        Enum = { icon = "", hl = "TSType" },
        Interface = { icon = "", hl = "TSType" },
        Function = { icon = "", hl = "TSFunction" },
        Variable = { icon = "", hl = "TSConstant" },
        Constant = { icon = "", hl = "TSConstant" },
        String = { icon = "", hl = "TSString" },
        Number = { icon = "", hl = "TSNumber" },
        Boolean = { icon = "B", hl = "TSBoolean" },
        Array = { icon = "", hl = "TSConstant" },
        Object = { icon = "⦿", hl = "TSType" },
        Key = { icon = "", hl = "TSType" },
        Null = { icon = "NULL", hl = "TSType" },
        EnumMember = { icon = "", hl = "TSField" },
        Struct = { icon = "פּ", hl = "TSType" },
        Event = { icon = "", hl = "TSType" },
        Operator = { icon = "", hl = "TSOperator" },
        TypeParameter = { icon = "𝙏", hl = "TSParameter" }
      }
    }
  )
end

return M
