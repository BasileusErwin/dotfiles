local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

if not vim.g.vscode then
    vim.g.mapleader = " "

    map('n', '<Space>', '<NOP>', opt)

    map('n', '<M-j>', '10<C-e>', { noremap = true })
    map('n', '<M-k>', '10<C-y>', { noremap = true })

    map('n', '<C-q>', ':q<CR>', opt)

    -- better window movement
    map('n', '<C-h>', '<C-w>h', opt)
    map('n', '<C-j>', '<C-w>j', opt)
    map('n', '<C-k>', '<C-w>k', opt)
    map('n', '<C-l>', '<C-w>l', opt)
end

map('n', '<C-s>', ':w<CR>', opt)
map('n', '<C-S-s>', ':wa<CR>', opt)

map('n', '<M-q>', ':bd<CR>', opt)

-- resize with arrows
map('n', '<C-M-k>', ':resize -2<CR>', opt)
map('n', '<C-M-j>', ':resize +2<CR>', opt)
map('n', '<C-M-h>', ':vertical resize -2<CR>', opt)
map('n', '<C-M-l>', ':vertical resize +2<CR>', opt)

-- better indenting
map('v', '<', '<gv', opt)
map('v', '>', '>gv', opt)

-- Move selected line / block of text in visual mode
map('x', 'K', ':move \'<-2<CR>gv-gv', opt)
map('x', 'J', ':move \'>+1<CR>gv-gv', opt)

map('n', '<S-M-v>', '<C-w>v', opt)
map('n', '<S-M-h>', '<C-w>s', opt)
