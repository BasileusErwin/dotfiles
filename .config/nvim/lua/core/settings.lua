local api = vim.api
local g = vim.g
local opt = vim.opt
local wo = vim.wo
local cmd = vim.cmd

-- Remap leader and local leader to <Space>
api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
g.mapleader = " "
g.maplocalleader = " "

g.did_load_filetypes = 1
opt.termguicolors = true -- Enable colors in terminal
opt.hlsearch = true --Set highlight on search
opt.mouse = "a" --Enable mouse mode
opt.breakindent = true --Enable break indent
opt.undofile = true --Save undo history
opt.ignorecase = true --Case insensitive searching unless /C or capital in search
opt.smartcase = true -- Smart case
opt.updatetime = 250 --Decrease update time
opt.signcolumn = "yes" -- Always show sign column
opt.clipboard = "unnamedplus" -- Access system clipboard
opt.timeoutlen = 300

wo.number = true
wo.relativenumber = true

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
opt.splitbelow = true
opt.splitright = true
opt.clipboard = "unnamedplus"
opt.conceallevel = 0 --So that I can see `` in markdown files
opt.background = "dark" --tell vim what the background color looks like
opt.showmode = false --We don't need to see things like -- INSERT -- anymore
g.closetag_filetypes = 'html,xhtml,phtml,xml,javascript,typescript,javascriptreact,typescriptreact,'
opt.laststatus = 3

opt.path:remove "/usr/include"
opt.path:append "**"
opt.wildignorecase = true
opt.wildignore:append "**/node_modules/*"
opt.wildignore:append "**/.git/*"
opt.wildignore:append "**/build/*"

-- Highlight on yank
cmd([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]])

cmd([[
    set colorcolumn=110
    set completeopt=menuone,noinsert,noselect
    set autochdir
    syntax enable
    filetype on
    filetype indent on
    filetype plugin on
    set hlsearch!
  ]])

