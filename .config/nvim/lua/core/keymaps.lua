local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

-- Better escape using jk in insert and terminal mode
map("i", "jk", "<ESC>", opts)
map("t", "jk", "<C-\\><C-n>", opts)

-- Center search results
map("n", "n", "nzz", opts)
map("n", "N", "Nzz", opts)

-- Visual line wraps
map("n", "k", "v:count == 0 ? 'gk' : 'k'", expr_opts)
map("n", "j", "v:count == 0 ? 'gj' : 'j'", expr_opts)

-- Better indent
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Paste over currently selected text without yanking it
map("v", "p", '"_dP', opts)

-- Switch buffer
map("n", "<S-h>", ":bprevious<CR>", opts)
map("n", "<S-l>", ":bnext<CR>", opts)

-- Cancel search highlighting with ESC
map("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", opts)

-- Move selected line / block of text in visual mode
map("x", "K", ":move '<-2<CR>gv-gv", opts)
map("x", "J", ":move '>+1<CR>gv-gv", opts)


if not vim.g.vscode then
    map('n', '<M-j>', '10<C-e>', { noremap = true })
    map('n', '<M-k>', '10<C-y>', { noremap = true })

    map('n', '<C-q>', ':q<CR>', opts)

    -- better window movement
    map('n', '<C-h>', '<C-w>h', opts)
    map('n', '<C-j>', '<C-w>j', opts)
    map('n', '<C-k>', '<C-w>k', opts)
    map('n', '<C-l>', '<C-w>l', opts)
end

map('n', '<C-s>', ':w<CR>', opts)
map('n', '<C-S-s>', ':wa<CR>', opts)

map('n', '<M-q>', ':bd<CR>', opts)

-- resize with arrows
map('n', '<C-M-k>', ':resize -2<CR>', opts)
map('n', '<C-M-j>', ':resize +2<CR>', opts)
map('n', '<C-M-h>', ':vertical resize -2<CR>', opts)
map('n', '<C-M-l>', ':vertical resize +2<CR>', opts)

-- better indenting
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)

map('n', '<S-M-v>', '<C-w>v', opts)
map('n', '<S-M-h>', '<C-w>s', opts)
