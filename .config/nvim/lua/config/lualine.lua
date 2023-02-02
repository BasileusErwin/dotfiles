local M = {}

local branch = {
  'branch',
  icons_enabled = true,
  icon = '',
}

local filetype = {
  'filetype',
  icons_enabled = true,
  symbols = {
    unix = 'LF',
    dos = 'CRLF',
    mac = 'CR',
  },
}

local diff = {
  'diff',
  colored = true,
  symbols = { added = ' ', modified = ' ', removed = ' ' },
}

local diagnostics = {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  sections = { 'error', 'warn' },
  symbols = { error = ' ', warn = ' ' },
  colored = true,
  update_in_insert = false,
  always_visible = true,
}

local function lsp_client(msg)
  msg = msg or ''
  local buf_clients = vim.lsp.buf_get_clients()
  if next(buf_clients) == nil then
    if type(msg) == 'boolean' or #msg == 0 then
      return ''
    end
    return msg
  end

  local buf_ft = vim.bo.filetype
  local buf_client_names = {}

  -- add client
  for _, client in pairs(buf_clients) do
    if client.name ~= 'null-ls' then
      table.insert(buf_client_names, client.name)
    end
  end

  -- add formatter
  local formatters = require 'config.lsp.null-ls.formatters'
  local supported_formatters = formatters.list_registered(buf_ft)
  vim.list_extend(buf_client_names, supported_formatters)

  -- add linter
  local linters = require 'config.lsp.null-ls.linter'
  local supported_linters = linters.list_registered(buf_ft)
  vim.list_extend(buf_client_names, supported_linters)

  -- add hover
  local hovers = require 'config.lsp.null-ls.hovers'
  local supported_hovers = hovers.list_registered(buf_ft)
  vim.list_extend(buf_client_names, supported_hovers)

  return '[' .. table.concat(buf_client_names, ', ') .. ']'
end

M.setup = function()
  local status_ok, lualine = pcall(require, 'lualine')

  if not status_ok then
    return
  end

  local status_navic_ok, navic = pcall(require, 'nvim-navic')

  if not status_navic_ok then
    return
  end

  lualine.setup({
    options = {
      theme = 'auto',
      icons_enabled = true,
      component_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },
      disabled_filetypes = { 'NvimTree' },
      always_divide_middle = true,
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = {
        diff,
        branch,
        diagnostics,
      },
      lualine_c = {
        {
          navic.get_location,
          cond = navic.is_available
        },
      },
      lualine_x = {
        { lsp_client, icon = ' ' },
      },
      lualine_y = { 'filename', 'encoding', filetype },
      lualine_z = { 'location' },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { 'filename' },
      lualine_x = { 'location' },
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    extensions = {}
  })
end

return M