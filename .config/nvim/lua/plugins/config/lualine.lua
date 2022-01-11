local theme
local M = {}

local status_ok, lualine = pcall(require, 'lualine')

if not status_ok then
	return
end

M.set_theme = function(p_theme) theme = p_theme end

local branch = {
  'branch',
  icons_enabled = true,
  icon = '',
}

local filetype = {
  "filetype",
  icons_enabled = true,
  symbols = {
    unix = 'LF',
    dos = 'CRLF',
    mac = 'CR',
  },
}

local diff = {
  "diff",
  colored = true,
  symbols = { added = " ", modified = " ", removed = " " },
}

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = false,
	update_in_insert = false,
	always_visible = true,
}

lualine.setup({
  options = {
    theme = theme,
    icons_enabled = true,
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = { 'NvimTree' },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { diff, branch, diagnostics },
    lualine_c = { 'filename' },
    lualine_x = { 'fileformat', filetype },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
})

return M
