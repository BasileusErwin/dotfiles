return {
	"akinsho/bufferline.nvim",
	event = "BufReadPre",
	enabled = true,
  commit = "a6ad228",
	branch = "main",
	keys = {
		{ "<S-TAB>", "<Cmd>BufferLineCyclePrev<CR>", mode = "n" },
		{ "<TAB>", "<Cmd>BufferLineCycleNext<CR>", mode = "n" },
	},
	opts = {
		options = {
			offsets = {
				{
					filetype = "neo-tree",
					text = " File Explorer",
					highlight = "Directory",
					text_align = "center",
					separator = false,
				},
				{
					filetype = "NvimTree",
					text = " File Explorer",
					highlight = "Directory",
					text_align = "center",
					separator = true,
				},
			},
			numbers = "none",
			diagnostics = "nvim_lsp",
			separator_style = "thick",
			show_tab_indicators = true,
			show_buffer_close_icons = false,
			show_close_icon = false,
			color_icons = true,
		},
	},
}
