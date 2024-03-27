-- Helpful: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
local map = vim.keymap.set

map("n", "<c-k>", ":wincmd k<CR>", {})
map("n", "<c-j>", ":wincmd j<CR>", {})
map("n", "<c-h>", ":wincmd h<CR>", {})
map("n", "<c-l>", ":wincmd l<CR>", {})

-- Center screen on big jump
map("n", "<c-u>", "<c-u>zz", {})
map("n", "<c-d>", "<c-d>zz", {})

-- Disable the arrow keys
map({ "n", "i" }, "<UP>", "<NOP>", {})
map({ "n", "i" }, "<DOWN>", "<NOP>", {})
map({ "n", "i" }, "<RIGHT>", "<NOP>", {})
map({ "n", "i" }, "<LEFT>", "<NOP>", {})

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next search result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev search result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- System clipboard
map("n", "<leader>p", '"+p', { desc = "Paste from system clipboard" })
map("v", "<leader>p", '"+p', { desc = "Paste from system clipboard" })
map("n", "<leader>P", '"+P', { desc = "Paste from system clipboard above" })
map("v", "<leader>P", '"+P', { desc = "Paste from system clipboard above" })
map("n", "<leader>y", '"+y', { desc = "Yank to system clipboard" })
map("v", "<leader>y", '"+y', { desc = "Yank to system clipboard" })
map("n", "<leader>Y", '"+y$', { desc = "Yank line to system clipboard" })
