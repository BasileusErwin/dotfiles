return {
  "kristijanhusak/vim-dadbod-ui",
  event = "VimEnter",
  enabled = false,
  dependencies = {
    "tpope/vim-dadbod",
    "kristijanhusak/vim-dadbod-completion",
    "tpope/vim-dotenv",
  },
  keys = { { "<leader>db", ':tab DBUI<cr>' } },
  init = function()
    require("config.database")
  end
}
