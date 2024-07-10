local M = {}

M.setup = function()
	local _, treesitter_config = pcall(require, "nvim-treesitter.configs")

	local config = {
		ensure_installed = "all",
		sync_install = true,
		highlight = {
			enable = true,
			use_languagetree = true,
			additional_vim_regex_highlighting = { "markdown" },
		},
		tree_docs = {
			enable = true,
			spec_config = {
				jsdoc = {
					slots = {
						class = { author = true },
					},
				},
			},
		},
		autotag = {
			enable = true,
		},
		context_commentstring = {
			enable = true,
			config = {
				typescript = "// %s",
				css = "/* %s */",
				scss = "/* %s */",
				html = "<!-- %s -->",
				lua = "-- %s",
				bash = "# %s",
			},
		},
		refactor = {
			highlight_definitions = { enable = true },
			highlight_current_scope = { enable = false },
		},
		rainbow = {
			enable = true,
			extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
			max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "gnn",
				node_incremental = "grn",
				scope_incremental = "grc",
				node_decremental = "grm",
			},
		},
		indent = { enable = true },
		matchup = { enable = true },
	}

	treesitter_config.setup(config)

	local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

	parser_config["ignis"] = {
		install_info = {
			url = "https://github.com/Ignis-lang/tree-sitter-ignis.git",
			files = { "src/parser.c" },
			branch = "main",
		},
		filetype = { "Ignis", "ignis" },
	}

	parser_config["ion"] = {
		install_info = {
			url = "https://github.com/Ignis-lang/tree-sitter-ion.git",
			files = { "src/parser.c" },
			branch = "main",
		},
		filetype = "ion",
	}

	parser_config.tsx.filetype_to_parsername = { "javascript", "javascript.jsx", "typescript.tsx" }
end

return M
