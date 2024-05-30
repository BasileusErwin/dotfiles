return {
	"karb94/neoscroll.nvim",
	enabled = true,
  commit = '0a86b3dc2555cb7872feedca64ef036b8417fb73',
	opts = {
    mappings = {}
  },
	config = function(_, opts)
		local neoscroll = require("neoscroll")
		local config = require("neoscroll.config")

		neoscroll.setup(opts)

		local map = {}
		map["<M-j>"] = { "scroll", { "vim.wo.scroll", "true", "10" } }
		map["<M-k>"] = { "scroll", { "-vim.wo.scroll", "true", "10" } }

		config.set_mappings(map)
	end,
}
