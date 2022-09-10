local map = vim.api.nvim_set_keymap
local status_ok, rust_tools = pcall(require,'rust-tools')
if not status_ok then
  return
end
local rust_tools_inlay_hints = require('rust-tools.inlay_hints')
local on_attach = require('plugins.config.lsp').on_attach

vim.cmd([[
  let g:rust_recommended_style = 0
  let g:rust_clip_command = 'xclip -selection clipboard'
]])

local opts = {
    tools = { -- rust-tools options
        autoSetHints = true,
        -- hover_with_actions = true,
        inlay_hints = {
            show_parameter_hints = true,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },
    hover_actions = {
      -- the border that is used for the hover window
      -- see vim.api.nvim_open_win()
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
      -- whether the hover action window gets automatically focused
      -- default: false
      auto_focus = true,
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
    server = {
        -- on_attach is a callback called when the language server attachs to the buffer
        path = vim.fn.stdpath("data").."/lsp_servers/rust/rust-analyzer",
        on_attach = on_attach,
        settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                -- enable clippy on save
                checkOnSave = {
                    command = "clippy"
                },
            }
        }
    },
}

rust_tools.setup(opts)

-- rust_tools_inlay_hints.set_inlay_hints()

map('n', '<Leader>ra', ":lua require'rust-tools.hover_actions'.hover_actions()<CR>", { noremap = true, silent = true })
map('n', '<Leader>rr', ":lua require('rust-tools.runnables').runnables()<CR>", { noremap = true, silent = true })
map('n', '<Leader>rgc', ":lua require'rust-tools.open_cargo_toml'.open_cargo_toml()<CR>", { noremap = true, silent = true })
map('n', '<Leader>rem', ":lua require'rust-tools.expand_macro'.expand_macro()<CR>", { noremap = true, silent = true })


