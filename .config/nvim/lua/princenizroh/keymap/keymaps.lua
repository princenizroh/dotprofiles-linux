local api = vim.api
local keymap = vim.keymap
local opts = { noremap = true, silent = true }
local mapkey = require("princenizroh.util.keymapper").mapvimkey

-- Nvim Tree
-- Directory Navigation
mapkey("<leader>e", ":NvimTreeToggle<CR>", "n")

-- Zen Mode
api.nvim_set_keymap("n", "<leader>zn", ":TZNarrow<CR>", {})
api.nvim_set_keymap("v", "<leader>zn", ":'<,'>TZNarrow<CR>", {})
api.nvim_set_keymap("n", "<leader>sm", ":TZFocus<CR>", {})
api.nvim_set_keymap("n", "<leader>zm", ":TZMinimalist<CR>", {})
api.nvim_set_keymap("n", "<leader>za", ":TZAtaraxis<CR>", {})

-- Neorg
-- Notes
mapkey("<leader>ng", "Neorg workspace notes", "n")

-- Indenting
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)

-- Buffer Navigation
mapkey("<leader>bb", "e #", "n") -- Switch to Other Buffer
mapkey("<leader>`", "e #", "n") -- Switch to Other Buffer

-- Don't yank with x
keymap.set("n", "x", '"_x')

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- New tab
mapkey("te", ":tabedit", "n")
mapkey("ss", ":split<Return><C-w>w", "n")
mapkey("sv", ":vsplit<Return><C-w>w", "n")
keymap.set("n", "<Tab>", "gt")
keymap.set("n", "<S-Tab>", "gT")

-- Move window
keymap.set("n", "<Space>", "<C-w>w")
keymap.set("", "s<left>", "<C-w>h")
keymap.set("", "s<up>", "<C-w>k")
keymap.set("", "s<down>", "<C-w>j")
keymap.set("", "s<right>", "<C-w>l")
keymap.set("", "sh", "<C-w>h")
keymap.set("", "sk", "<C-w>k")
keymap.set("", "sj", "<C-w>j")
keymap.set("", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- button mapping
api.nvim_set_keymap("i", '"', '""<left>', opts)
api.nvim_set_keymap("i", "'", "''<left>", opts)
api.nvim_set_keymap("i", "(", "()<left>", opts)
api.nvim_set_keymap("i", "[", "[]<left>", opts)
api.nvim_set_keymap("i", "{", "{}<left>", opts)
api.nvim_set_keymap("i", "{<CR>", "{<CR>}<ESC>O", opts)
api.nvim_set_keymap("i", "{;<CR>", "{<CR>};<ESC>O", opts)
api.nvim_set_keymap("x", "[", 'c[<C-r>"]<Esc>', opts)
api.nvim_set_keymap("x", '"', [[<Esc>`>a"<Esc>`<i"<Esc>]], opts)
api.nvim_set_keymap("x", "'", "<Esc>`>a'<Esc>`<i'<Esc>", opts)
api.nvim_set_keymap("x", "(", 'c(<C-r>")<Esc>', opts)
api.nvim_set_keymap("x", "{", 'c{<C-r>"}<Esc>', opts)
api.nvim_set_keymap("x", "{;", 'c{<C-r>"}<Esc>', opts)
