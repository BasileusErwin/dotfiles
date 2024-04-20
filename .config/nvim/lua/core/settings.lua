local api = vim.api
local o = vim.o
local g = vim.g
local opt = vim.opt
local wo = vim.wo
local cmd = vim.cmd

-- Remap leader and local leader to <Space>
api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
g.mapleader = " "
g.maplocalleader = " "
g.norule = false

opt.termguicolors = true      -- Enable colors in terminal
opt.hlsearch = true           --Set highlight on search
opt.mouse = "a"               --Enable mouse mode
opt.breakindent = true        --Enable break indent
opt.undofile = true           --Save undo history
opt.ignorecase = true         --Case insensitive searching unless /C or capital in search
opt.smartcase = true          -- Smart case
opt.updatetime = 250          --Decrease update time
opt.signcolumn = "yes"        -- Always show sign column
opt.clipboard = "unnamedplus" -- Access system clipboard
opt.timeoutlen = 300

wo.number = true
wo.relativenumber = true

o.foldcolumn = '1' -- '0' is not bad
o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
o.foldlevelstart = 99
o.foldenable = true

o.backup = false
opt.swapfile = false
opt.laststatus = 0
opt.autoindent = true
opt.expandtab = true
opt.smarttab = true
opt.smartindent = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.showtabline = 2
opt.hidden = true
wo.wrap = false
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.ruler = true
opt.cursorline = true
opt.cursorcolumn = true
opt.splitbelow = true
opt.splitright = true
opt.clipboard = "unnamedplus"
opt.conceallevel = 0    --So that I can see `` in markdown files
opt.background = "dark" --tell vim what the background color looks like
opt.showmode = false    --We don't need to see things like -- INSERT -- anymore
opt.filetype = "on"
g.closetag_filetypes = 'html,xhtml,phtml,xml,javascript,typescript,javascriptreact,typescriptreact'
opt.laststatus = 3

-- Highlight on yank
cmd([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end

  set hlsearch!
  setlocal foldmethod=indent
  set nofoldenable
  set foldlevel=99
  set colorcolumn=120
]])

if g.neovide then
  g.neovide_cursor_animation_length = 0
  g.neovide_scroll_animation_length = 0
  g.neovide_cursor_trail_size = 0
  g.neovide_scroll_animation_length = 2
  g.neovide_no_idle = false
  g.neovide_underline_automatic_scaling = false

  g.neovide_transparency = 0.8
  g.transparency = 0.8

  g.neovide_refresh_rate = 120
  g.neovide_refresh_rate_idle = 120
end

vim.filetype.add({
  extension = {
    ign = 'ignis',
    ion = 'ion',
  },
})
