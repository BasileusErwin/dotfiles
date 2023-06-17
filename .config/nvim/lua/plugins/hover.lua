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

    if vim.api.nvim_buf_get_option(vim.api.nvim_get_current_buf(), 'filetype') == 'rust' then
      vim.keymap.set("n", "K", require("rust-tools").hover_actions.hover_actions())
    else
      vim.keymap.set("n", "K", require("hover").hover)
    end

    vim.keymap.set("n", "gK", require("hover").hover_select)
  end
}
