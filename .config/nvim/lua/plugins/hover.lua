return {
  "lewis6991/hover.nvim",
  opts = {
    init = function()
      require("hover.providers.lsp")
      require('hover.providers.gh')
      require('hover.providers.gh_user')
      require('hover.providers.jira')
      require('hover.providers.man')
      require('hover.providers.dictionary')
    end,
    preview_opts = {
      border = nil
    },
    preview_window = false,
    title = true
  },
  config = function(_, opts)
    require("hover").setup(opts)
    vim.keymap.set("n", "K", require("hover").hover)

    vim.keymap.set("n", "gK", require("hover").hover_select)
  end
}
