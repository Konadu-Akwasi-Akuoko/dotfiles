-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- General Keymaps

-- use jk to exit insert mode
-- keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

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

-- tab management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- buffer management
keymap.set("n", "<leader>bd", "<cmd>bufdo bd<CR>", { desc = "Delete all buffers" }) -- delete all buffers

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

-- sourcing of lua files
keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Source the current file and run it" })

-- keymap.set leader+w to save all files in normal and mode
keymap.set("n", "<leader>w", "<cmd>wa<CR>", { desc = "Save all files" })

-- Nvim DAP
keymap.set("n", "<Leader>dl", "<cmd>lua require'dap'.step_into()<CR>", { desc = "Debugger step into" })
keymap.set("n", "<Leader>dj", "<cmd>lua require'dap'.step_over()<CR>", { desc = "Debugger step over" })
keymap.set("n", "<Leader>dk", "<cmd>lua require'dap'.step_out()<CR>", { desc = "Debugger step out" })
keymap.set("n", "<Leader>dc", "<cmd>lua require'dap'.continue()<CR>", { desc = "Debugger continue" })
keymap.set("n", "<Leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "Debugger toggle breakpoint" })
keymap.set(
	"n",
	"<Leader>dd",
	"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
	{ desc = "Debugger set conditional breakpoint" }
)
keymap.set("n", "<Leader>de", "<cmd>lua require'dap'.terminate()<CR>", { desc = "Debugger reset" })
keymap.set("n", "<Leader>dr", "<cmd>lua require'dap'.run_last()<CR>", { desc = "Debugger run last" })
keymap.set("n", "<Leader>du", "<cmd>lua require'dapui'.toggle()<CR>", { desc = "Toggle Debug UI" })

-- rustaceanvim
keymap.set("n", "<Leader>dt", "<cmd>lua vim.cmd('RustLsp testables')<CR>", { desc = "Debugger testables" })

-- Add explicit visual mode mappings for both visual and visual-line modes
-- keymap.set("x", "gc", "<Plug>(comment_toggle_linewise_visual)", { desc = "Toggle comment for visual selection" })
-- keymap.set("v", "gc", "<Plug>(comment_toggle_linewise_visual)", { desc = "Toggle comment for visual selection" })

-- -- Copilot Chat key mappings
-- keymap.set("n", "<leader>ccc", ":CopilotChat<CR>", { desc = "Open chat window with optional input" })
-- keymap.set("n", "<leader>cco", ":CopilotChatOpen<CR>", { desc = "Open chat window" })
-- keymap.set("n", "<leader>ccx", ":CopilotChatClose<CR>", { desc = "Close chat window" })
-- keymap.set("n", "<leader>cct", ":CopilotChatToggle<CR>", { desc = "Toggle chat window" })
-- keymap.set("n", "<leader>ccs", ":CopilotChatStop<CR>", { desc = "Stop current copilot output" })
-- keymap.set("n", "<leader>ccr", ":CopilotChatReset<CR>", { desc = "Reset chat window" })
-- keymap.set("n", "<leader>ccS", ":CopilotChatSave<CR>", { desc = "Save chat history to file" })
-- keymap.set("n", "<leader>ccl", ":CopilotChatLoad<CR>", { desc = "Load chat history from file" })
-- keymap.set("n", "<leader>ccd", ":CopilotChatDebugInfo<CR>", { desc = "Show debug information" })
-- keymap.set("n", "<leader>ccm", ":CopilotChatModels<CR>", { desc = "View and select available models" })
-- keymap.set("n", "<leader>cca", ":CopilotChatAgents<CR>", { desc = "View and select available agents" })
-- keymap.set(
-- 	{ "v", "x" },
-- 	"<leader>ccE",
-- 	":CopilotChatExplain<CR>",
-- 	{ desc = "Ask Copilot to explain the selected code" }
-- )
-- keymap.set({ "v", "x" }, "<leader>ccR", ":CopilotChatReview<CR>", { desc = "Ask Copilot to review the selected code" })
-- keymap.set({ "v", "x" }, "<leader>ccF", ":CopilotChatFix<CR>", { desc = "Ask Copilot to fix the selected code" })
-- keymap.set(
-- 	{ "v", "x" },
-- 	"<leader>ccO",
-- 	":CopilotChatOptimize<CR>",
-- 	{ desc = "Ask Copilot to optimize the selected code" }
-- )
-- keymap.set(
-- 	{ "v", "x" },
-- 	"<leader>ccD",
-- 	":CopilotChatDocs<CR>",
-- 	{ desc = "Ask Copilot to add documentation comments to the selected code" }
-- )
-- keymap.set(
-- 	{ "v", "x" },
-- 	"<leader>ccT",
-- 	":CopilotChatTests<CR>",
-- 	{ desc = "Ask Copilot to generate tests for the selected code" }
-- )
-- keymap.set(
-- 	{ "v", "x" },
-- 	"<leader>ccC",
-- 	":CopilotChatCommit<CR>",
-- 	{ desc = "Ask Copilot to write a commit message for the change" }
-- )
