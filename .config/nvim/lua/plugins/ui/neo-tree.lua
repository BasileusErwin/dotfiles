return {
	"loctvl842/neo-tree.nvim",
	enabled = false,
	event = { "VeryLazy", "VimEnter" },
	cmd = "Neotree",
	dependencies = {
		{
			"MunifTanjim/nui.nvim",
		},
	},
	keys = {
		{
			"<leader>e",
			function()
				require("neo-tree.command").execute({ toggle = true, position = "left" })
			end,
			desc = "Explorer",
			remap = true,
		},
	},
	opts = {
		close_if_last_window = false,
		enable_git_status = true,
		enable_diagnostics = true,
		sources = { "filesystem" },
		source_selector = {
			winbar = true,
			statusline = true, -- toggle to show selector on statusline
			content_layout = "center",
			tabs_layout = "equal",
			tab_labels = {
				filesystem = "  ",
			},
		},
		default_component_configs = {
			container = {
				enable_character_fade = true,
			},
			indent = {
				indent_size = 2,
				padding = 1,
				with_markers = true,
				indent_marker = "│",
				last_indent_marker = "└",
				highlight = "NeoTreeIndentMarker",
				with_expanders = true,
				expander_collapsed = "",
				expander_expanded = "",
				expander_highlight = "NeoTreeExpander",
			},
			icon = {
				folder_closed = "",
				fold3r_open = "",
				folder_empty = "",
				default = " ",
				highlight = "NeoTreeFileIcon",
			},
			modified = {
				symbol = "[+]",
				highlight = "NeoTreeModified",
			},
			name = {
				trailing_slash = true,
				use_git_status_colors = true,
				highlight = "NeoTreeFileName",
			},
			git_status = {
				symbols = {
					renamed = "󰑕",
					untracked = "",
					ignored = "",
					unstaged = "",
					staged = "",
					conflict = "",
				},
			},
		},
		window = {
			position = "left",
			width = 30,
			mapping_options = {
				noremap = true,
				nowait = true,
			},
			mappings = {
				["<space>"] = "",
				["<1-LeftMouse>"] = "open",
				["<cr>"] = "open",
				["l"] = "open",
				["h"] = "close_node",
				["S"] = "open_split",
				["s"] = "open_vsplit",
				["t"] = "open_tabnew",
				["w"] = "open_with_window_picker",
				["C"] = "close_node",
				["a"] = {
					"add",
					config = {
						show_path = "none", -- "none", "relative", "absolute"
					},
				},
				["A"] = "add_directory", -- also accepts the config.show_path option.
				["d"] = "delete",
				["r"] = "rename",
				["c"] = "copy_to_clipboard",
				["x"] = "cut_to_clipboard",
				["p"] = "paste_from_clipboard",
				["y"] = "copy", -- takes text input for destination
				["m"] = "move", -- takes text input for destination
				["q"] = "close_window",
				["R"] = "refresh",
				["?"] = "show_help",
			},
		},
		filesystem = {
			bind_to_cwd = true,
			filtered_items = {
				visible = false,
				hide_dotfiles = false,
				hide_gitignored = false,
				hide_by_name = {},
				hide_by_pattern = {},
				never_show = {},
			},
			follow_current_file = true,
			group_empty_dirs = false,
			use_libuv_file_watcher = true,
		},
	},
}
