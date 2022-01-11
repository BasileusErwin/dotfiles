local map = vim.api.nvim_set_keymap
vim.g.mapleader = " "

map('n', '<Space>', '<NOP>', { noremap = true, silent = true })

-- explorer
map('n', '<Leader>n', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

map("n", "<F4>", "<cmd>Telescope resume<cr>", { noremap = true, silent = true })
map("n", "<F5>", "<cmd>Telescope commands<cr>", { noremap = true, silent = true })

map('n', '<C-s>', ':w<CR>', { silent = true })
map('n', '<C-S-s>', ':wa<CR>', { silent = true })
map('n', '<C-q>', ':q<CR>', { silent = true })
map('n', '<M-q>', ':bd<CR>', { silent = true })

-- better window movement
map('n', '<C-h>', '<C-w>h', { silent = true })
map('n', '<C-j>', '<C-w>j', { silent = true })
map('n', '<C-k>', '<C-w>k', { silent = true })
map('n', '<C-l>', '<C-w>l', { silent = true })

-- resize with arrows
map('n', '<M-k>', ':resize -2<CR>', { noremap = true, silent = true })
map('n', '<M-j>', ':resize +2<CR>', { noremap = true, silent = true })
map('n', '<M-h>', ':vertical resize -2<CR>', { noremap = true, silent = true })
map('n', '<M-l>', ':vertical resize +2<CR>', { noremap = true, silent = true })

-- better indenting
map('v', '<', '<gv', { noremap = true, silent = true })
map('v', '>', '>gv', { noremap = true, silent = true })

-- I hate escape
map('i', 'jk', '<ESC>', { noremap = true, silent = true })
map('i', 'ii', '<ESC>', { noremap = true, silent = true, nowait = true })
map('i', 'kj', '<ESC>', { noremap = true, silent = true })
map('i', 'jj', '<ESC>', { noremap = true, silent = true })

-- Tab switch buffer
map('n', '<TAB>', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
map('n', '<S-TAB>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })

-- Move selected line / block of text in visual mode
map('x', 'K', ':move \'<-2<CR>gv-gv', { noremap = true })
map('x', 'J', ':move \'>+1<CR>gv-gv', { noremap = true })

