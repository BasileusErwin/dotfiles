return {
	"loctvl842/neo-tree.nvim",
	enabled = true,
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
				git_status = "  ",
				diagnostics = "  ",
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
			components = {
				icon = function(config, node, state)
					local highlights = require("neo-tree.ui.highlights")
					local icon = config.default or " "
					local padding = config.padding or " "
					local highlight = config.highlight or highlights.FILE_ICON

					if node.type == "directory" then
						highlight = highlights.DIRECTORY_ICON
						if node:is_expanded() then
							icon = config.folder_open or "-"
						else
							icon = config.folder_closed or "+"
						end
					elseif node.type == "file" then
						local success, web_devicons = pcall(require, "nvim-web-devicons")
						if success then
							local devicon, hl = web_devicons.get_icon(node.name, node.ext)
							icon = devicon or icon
							highlight = hl or highlight
						end
					end

					return {
						text = icon .. padding,
						highlight = highlight,
					}
				end,
			},
			bind_to_cwd = false,
			filtered_items = {
				visible = false,
				hide_dotfiles = false,
				hide_gitignored = false,
				hide_by_name = {},
				hide_by_pattern = {},
				never_show = {},
			},
			follow_current_file = false,
			group_empty_dirs = false,
			use_libuv_file_watcher = true,
			window = {
				mappings = {
					["H"] = "navigate_up",
					["<bs>"] = "toggle_hidden",
					["."] = "set_root",
					["/"] = "fuzzy_finder",
					["f"] = "filter_on_submit",
					["<c-x>"] = "clear_filter",
					["[g"] = "prev_git_modified",
					["]g"] = "next_git_modified",
				},
			},
		},
		diagnostics = {
			symbols = {
				error = "",
				warn = "",
				hint = "",
				info = "",
			},
			highlights = {
				hint = "DiagnosticSignHint",
				info = "DiagnosticSignInfo",
				warn = "DiagnosticSignWarn",
				error = "DiagnosticSignError",
			},
		},
		renderers = {
			directory = {
				{ "indent" },
				{ "icon" },
				{ "current_filter" },
				{
					"container",
					content = {
						{ "name", zindex = 10 },
						{
							"symlink_target",
							zindex = 10,
							highlight = "NeoTreeSymbolicLinkTarget",
						},
						{ "clipboard", zindex = 10 },
						{
							"diagnostics",
							errors_only = true,
							zindex = 20,
							align = "right",
							hide_when_expanded = false,
						},
						{
							"git_status",
							zindex = 10,
							align = "right",
							hide_when_expanded = true,
						},
					},
				},
			},
			file = {
				{ "indent" },
				{ "icon" },
				{
					"container",
					content = {
						{
							"name",
							zindex = 10,
						},
						{ "clipboard", zindex = 10 },
						{ "bufnr", zindex = 10 },
						{ "modified", zindex = 20, align = "right" },
						{ "diagnostics", zindex = 20, align = "right" },
						{ "git_status", zindex = 15, align = "right" },
					},
				},
			},
			message = {
				{ "indent", with_markers = false },
				{ "name", highlight = "NeoTreeMessage" },
			},
			terminal = {
				{ "indent" },
				{ "icon" },
				{ "name" },
				{ "bufnr" },
			},
		},
	},
}
