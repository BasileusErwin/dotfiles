return {
	{
		"rest-nvim/rest.nvim",
		ft = "http",
		enabled = false,
		dependencies = { "vhyrro/luarocks.nvim" },
		config = function()
			require("rest-nvim").setup()
		end,
	},
}
