vim.cmd([[
	set termguicolors
	let ayucolor="mirage"
	colorscheme ayu
]])

require'lualine'.setup {
	option = {theme = 'ayu'}
}