local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Tree navigtion
keymap.set("n", "<leader>m", ":NvimTreeFocus<CR>", opts)
keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>", opts)

-- Pane navigation
keymap.set("n", "<C-h>", "<C-w>h", opts) -- Navigate Left
keymap.set("n", "<C-j>", "<C-w>j", opts) -- Navigate Down
keymap.set("n", "<C-k>", "<C-w>k", opts) -- Navigate Up
keymap.set("n", "<C-l>", "<C-w>l", opts) -- Navigate Right

-- Window managment
keymap.set("n", "<leader>sv", ":vsplit<CR>", opts) -- Split Vertically
keymap.set("n", "<leader>sh", ":split<CR>", opts) -- Split Horizontally
keymap.set("n", "<leader>sm", ":MaximizerTolggle<CR>", opts) -- Toggle Minimize

keymap.set("n", "<leader>h", "<C-w>H", opts)
keymap.set("n", "<leader>j", "<C-w>J", opts)
keymap.set("n", "<leader>k", "<C-w>K", opts)
keymap.set("n", "<leader>l", "<C-w>L", opts)

keymap.set("n", "<A-h>", "<C-w>>", opts)
keymap.set("n", "<A-j>", "<C-w>-", opts)
keymap.set("n", "<A-k>", "<C-w>+", opts)
keymap.set("n", "<A-l>", "<C-w><", opts)
