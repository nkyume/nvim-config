local opt = vim.opt

-- Appearance
opt.number = true
opt.relativenumber = true
opt.wrap = false
opt.termguicolors = true

-- Indent
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2

-- Behavior
opt.mouse = ""
opt.ignorecase = true
opt.clipboard = "unnamedplus"
opt.splitbelow = true
opt.splitright = true
opt.ve = "block"
opt.inccommand = "split"
opt.scrolloff = 997

vim.g.python3_host_prog = "~/.virtualenvs/nvim/bin/python3"

