require("nvchad.mappings")

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opts = { noremap = true, silent = true }

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- increase/decrease number
map("n", "+", "<C-a>", opts)
map("n", "-", "<C-x>", opts)

-- 高效移动
map({ "n", "v" }, "J", "5j", opts)
map({ "n", "v" }, "K", "5k", opts)
map({ "n", "v" }, "H", "^", opts)
map({ "n", "v" }, "L", "$", opts)

-- Ctrl+h 和 Ctrl+l 控制缩进
map("v", "<A-h>", "<gv", opts)
map("v", "<A-l>", ">gv", opts)
-- Ctrl+j 和 Ctrl+k 控制上下移动选中的文本
map("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- split windows
map("n", "<leader>sh", ":vsplit<CR>", opts)
map("n", "<leader>sl", ":vsplit<CR><C-w>l", opts)
map("n", "<leader>sj", ":split<CR><C-w>j", opts)
map("n", "<leader>sk", ":split<CR>", opts)

map("n", "<Tab>", ":bnext<CR>", opts)
map("n", "<S-Tab>", ":bprevious<CR>", opts)

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
