return {
	"nvim-tree/nvim-web-devicons",
	lazy = false,
	opts = {
		color_icons = true,
		override_by_extension = {
			["ign"] = {
				icon = "󰈸",
				color = "#702963",
				name = "Ignis",
			},
      ["ion"] = {
        icon = "",
        color = "#702963",
        name = "Ion",
      }
		},
	},
}
