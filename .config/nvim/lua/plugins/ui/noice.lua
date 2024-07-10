return {
  'folke/noice.nvim',
  enabled = true,
  opts = {
    lsp = {
      progress = {
        enabled = false,
      },
      signature = {
        enabled = false,
      },
      hover = {
        enabled = false,
      },
    },
  },
  dependencies = {
    {
      "rcarriga/nvim-notify",
      opts = {
        frequency = 10,
        render = "minimal",
        stages = "fade_in_slide_out",
        timeout = 4000,
        top_down = false,
        background_colour = "#000000",
      },
    },
    'MunifTanjim/nui.nvim'
  },
  config = function(_, opts)
    require("noice").setup(opts)

    require("telescope").load_extension("noice")
  end
}
