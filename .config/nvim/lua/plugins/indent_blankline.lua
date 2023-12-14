return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  lazy = false,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "HiPhish/rainbow-delimiters.nvim"
  },
  opts = {
    indent = { },
    scope = {
      enabled = true,
      show_start = true,
      show_end = true,
      injected_languages = true,
    },
    exclude = {
      filetypes = { "help", "alpha", "dashboard", "Trouble", "packer", "NvimTree" },
      buftypes = { "terminal", "nofile" },
    },
    whitespace = {
      highlight = { "Whitespace" },
      remove_blankline_trail = true
    }
  },
  config = function(_, otps)
    vim.opt.list = true
    vim.opt.listchars:append("space:⋅")

    require("ibl").setup(otps)
  end,
}
