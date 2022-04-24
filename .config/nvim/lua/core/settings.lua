vim.cmd([[
  let g:mapleader = "\<Space>"
  set colorcolumn=81
  set completeopt=menuone,noinsert,noselect
  nmap <silent> <C-l> <Plug>(jsdoc)
  set autochdir
  syntax enable
  filetype on
  filetype indent on
  filetype plugin on
  set hlsearch!
]])
-- Do not source the default filetype.vim
vim.g.did_load_filetypes = 1
-- Number
vim.wo.number = true
vim.wo.relativenumber = true

--Always display the status line
vim.o.laststatus=0

--Good auto indent
vim.o.autoindent=true

-- Converts tabs to spaces
vim.o.expandtab=true

--Makes tabbing smarter will realize you have 2 vs 4
vim.o.smarttab=true

--Makes indenting smart
vim.o.smartindent=true

--Insert 2 spaces for a tab
vim.o.tabstop=2

--Change the number of space characters inserted for indentation
vim.o.shiftwidth=2

--Always show tabs
vim.o.showtabline=2

vim.o.formatoptions = vim.o.formatoptions .. 'cro'

--Required to keep multiple buffers open multiple buffers
vim.o.hidden=true

--Display long lines as just one line
vim.wo.wrap=false

--The encoding written to file
vim.o.encoding="utf-8"

-- The encoding displayed
vim.o.fileencoding="utf-8"
-- Show the cursor position all the time
vim.o.ruler=true

--Enable your mouse
vim.o.mouse="a"

--Enable highlighting of the current line
vim.o.cursorline=true

--Horizontal splits will automatically be below
vim.o.splitbelow=true

--Vertical splits will automatically be to the right
vim.o.splitright=true

--Copy paste between vim and everything else
vim.o.clipboard="unnamedplus"

vim.o.termguicolors=true
vim.o.conceallevel=0 --So that I can see `` in markdown files
vim.o.background="dark" --tell vim what the background color looks like
vim.o.showmode=false --We don't need to see things like -- INSERT -- anymore
vim.o.guifont="JetBrainsMono\\ Nerd\\ Font\\ Mono:h18"

vim.g.closetag_filetypes = 'html,xhtml,phtml,xml,javascript,typescript,javascriptreact,typescriptreact,'

vim.opt.laststatus = 3
