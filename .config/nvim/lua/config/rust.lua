local M = {}

M.setup = function()
  local status_ok, rust_tools = pcall(require, 'rust-tools')
  if not status_ok then
    return
  end
  local on_attach = require('config.lsp').on_attach

  vim.cmd([[
    let g:rust_recommended_style = 0
    let g:rust_clip_command = 'xclip -selection clipboard'
  ]])

  local opts = {
    tools = { -- rust-tools options
      autoSetHints = true,
      inlay_hints = {
        auto = true,
        show_parameter_hints = true,
        only_current_line = false,
        parameter_hints_prefix = "<- ",
        other_hints_prefix = "=> ",
        max_len_align = false,
        max_len_align_padding = 1,
        right_align = false,
        right_align_padding = 7,
        highlight = "Comment",
      },
    },
    hover_actions = {
      border = {
        { "╭", "FloatBorder" },
        { "─", "FloatBorder" },
        { "╮", "FloatBorder" },
        { "│", "FloatBorder" },
        { "╯", "FloatBorder" },
        { "─", "FloatBorder" },
        { "╰", "FloatBorder" },
        { "│", "FloatBorder" },
      },
      auto_focus = true,
    },
    server = {
      path = vim.fn.stdpath("data") .. "/lsp_servers/rust/rust-analyzer",
      on_attach = on_attach,
      settings = {
        ["rust-analyzer"] = {
          checkOnSave = {
            command = "clippy"
          },
        }
      }
    },
  }

  rust_tools.setup(opts)

  rust_tools.inlay_hints.set()
  rust_tools.inlay_hints.enable()
end

return M
