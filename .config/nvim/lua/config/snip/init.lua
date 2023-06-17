local M = { }

M.setup = function ()
  local ls = require("luasnip")

  ls.config.set_config({
    history = true,
    updateevents = "TextChanged,TextChangedI",
    enable_autosnippets = true,
  })

  require("luasnip.loaders.from_vscode").lazy_load()
  require("luasnip.loaders.from_snipmate").lazy_load()

  require("luasnip.loaders.from_vscode").lazy_load({ path = "./lua/config/snip/snippets/javascript" })

  require('luasnip').filetype_extend("rust", { "rust" })
  require('luasnip').filetype_extend("python", { "python" })
  require('luasnip').filetype_extend("go", { "go" })
end

return M
