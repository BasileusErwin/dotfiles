local on_attach = require("config.lsp").on_attach

return {
	"mrcjkb/rustaceanvim",
	version = "^4",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"ron-rs/ron.vim",
		"vxpm/ferris.nvim",
	},
	config = function()
		vim.cmd([[
      let g:rust_recommended_style = 0
      let g:rust_clip_command = 'xclip -selection clipboard'
    ]])

		vim.g.rustaceanvim = {
			server = {
				on_attach = on_attach,
				standalone = true,
				code_actions = {
					ui_select_fallback = true,
				},
				float_win_config = {
					auto_focus = true,
					border = {
						{ "╭", "FloatBorder" },
						{ "─", "FloatBorder" },
						{ "╮", "FloatBorder" },
						{ "│", "FloatBorder" },
						{ "╯", "FloatBorder" },
						{ "─", "FloatBorder" },
						{ "╰", "FloatBorder" },
						{ "│", "FloatBorder" },
					},
				},
				settings = function(project_root)
					return require("rustaceanvim.config.server").load_rust_analyzer_settings(project_root)
				end,
				default_settings = {
					["rust-analyzer"] = {
						checkOnSave = {
							command = "clippy",
						},
					},
				},
			},
		}
	end,
}
