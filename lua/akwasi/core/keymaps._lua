-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
-- keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window
keymap.set("n", "<leader>ss", "<C-w>x", { desc = "Swap windows" }) -- swap windows
keymap.set("n", "<leader>sw", "<cmd>set wrap<CR>", { desc = "Set soft wrap on current window" }) -- Set soft wrap on current window
keymap.set("n", "<leader>sn", "<cmd>set nowrap<CR>", { desc = "Set no soft wrap on current window" }) -- Set no soft wrap on current window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- buffer management
keymap.set("n", "<leader>bd", "<cmd>bufdo bd<CR>", { desc = "Delete all buffers" }) -- delete all buffers
keymap.set("n", "<leader>bb", "<cmd>Telescope buffers<CR>", { desc = "Show all buffers with Telescope" })

-- hop management
keymap.set("n", "<leader>jj", "<cmd>HopWord <CR>", { desc = "Hop to a word" })
keymap.set("n", "<leader>jc", "<cmd>HopCamelCase <CR>", { desc = "Hop to a camelCase word" })
keymap.set("n", "<leader>jb", "<cmd>HopChar1 <CR>", { desc = "Hop to any character in the current buffer" })
keymap.set("n", "<leader>jg", "<cmd>HopChar2 <CR>", { desc = "Hop to any bigrams in the current buffer" })
keymap.set(
	"n",
	"<leader>jp",
	"<cmd>HopPattern <CR>",
	{ desc = "Hop to an arbitrary search akin to / and go to any occurrences" }
)
keymap.set("n", "<leader>jl", "<cmd>HopLine <CR>", { desc = "Hop to any line" })
keymap.set("n", "<leader>js", "<cmd>HopLineStart <CR>", { desc = "Hop to any line start" })
keymap.set("n", "<leader>ja", "<cmd>HopAnywhere <CR>", { desc = "Hop to anywhere" })
keymap.set("n", "<leader>jt", "<cmd>HopNodes <CR>", { desc = "Hop to treesitter nodes" })
keymap.set("n", "<leader>jv", "<cmd>HopPaste <CR>", { desc = "Paste text in the hinted position without jumping" })
keymap.set(
	"n",
	"<leader>jy",
	"<cmd>HopYankChar1 <CR>",
	{ desc = "Yank the text between two hinted position without jumping" }
)
keymap.set("n", "<leader>jm", "<cmd>Hop*MW <CR>", { desc = "Use Hop cross windows with multi-windows support" })
