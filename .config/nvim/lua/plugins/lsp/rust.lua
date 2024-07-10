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
			},
		}
	end,
}
