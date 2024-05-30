return {
	{
		"rest-nvim/rest.nvim",
		ft = "http",
		dependencies = { "vhyrro/luarocks.nvim" },
		config = function()
			require("rest-nvim").setup()
		end,
	},
}
