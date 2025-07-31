-- set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap.set

-- General
keymap("n", "<leader>nh", "<cmd>nohl<CR>", { desc = "Clear search highlights", silent = true, noremap = true })
keymap("n", "x", '"_x', { desc = "Delete character without yanking", silent = true, noremap = true })
keymap("n", "<leader>+", "<C-a>", { desc = "Increment number", silent = true, noremap = true })
keymap("n", "<leader>-", "<C-x>", { desc = "Decrement number", silent = true, noremap = true })
keymap("n", "<leader>w", "<cmd>wa<CR>", { desc = "Save current file", silent = true, noremap = true })
keymap("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Source current file", silent = true, noremap = true })

-- Nvim Tree, File Explorer
keymap("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer", silent = true, noremap = true })
keymap(
	"n",
	"<leader>ef",
	"<cmd>NvimTreeFindFileToggle<CR>",
	{ desc = "Toggle file explorer on current file", silent = true, noremap = true }
)
keymap(
	"n",
	"<leader>ec",
	"<cmd>NvimTreeCollapse<CR>",
	{ desc = "Collapse file explorer", silent = true, noremap = true }
)
keymap("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer", silent = true, noremap = true })

-- Trouble
keymap(
	"n",
	"<leader>xw",
	"<cmd>Trouble diagnostics toggle<CR>",
	{ desc = "Workspace Diagnostics (Trouble)", silent = true, noremap = true }
)
keymap(
	"n",
	"<leader>xd",
	"<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
	{ desc = "Document Diagnostics (Trouble)", silent = true, noremap = true }
)
keymap(
	"n",
	"<leader>xq",
	"<cmd>Trouble quickfix toggle<CR>",
	{ desc = "Quickfix List (Trouble)", silent = true, noremap = true }
)
keymap(
	"n",
	"<leader>xl",
	"<cmd>Trouble loclist toggle<CR>",
	{ desc = "Location List (Trouble)", silent = true, noremap = true }
)

-- Buffer Management
local function delete_unmodified_buffers()
	local bufs = vim.api.nvim_list_bufs()
	local bufnrs_to_delete = {}
	for _, b in ipairs(bufs) do
		if vim.bo[b].buflisted and not vim.bo[b].modified then
			table.insert(bufnrs_to_delete, b)
		end
	end
	if #bufnrs_to_delete > 0 then
		vim.cmd("bdelete " .. table.concat(bufnrs_to_delete, " "))
	else
		vim.notify("No unmodified buffers to delete.", vim.log.levels.INFO)
	end
end
keymap(
	"n",
	"<leader>bd",
	delete_unmodified_buffers,
	{ desc = "Delete all unmodified buffers", silent = true, noremap = true }
)
keymap("n", "<leader>bD", "<cmd>bdelete<CR>", { desc = "Delete Current Buffer", silent = true, noremap = true })

-- Window Management
keymap("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically", silent = true, noremap = true })
keymap("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally", silent = true, noremap = true })
keymap("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size", silent = true, noremap = true })
keymap("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split", silent = true, noremap = true })
keymap("n", "<leader>sw", "<cmd>set wrap<CR>", { desc = "Enable soft wrap", silent = true, noremap = true })
keymap("n", "<leader>sn", "<cmd>set nowrap<CR>", { desc = "Disable soft wrap", silent = true, noremap = true })

-- Tab Management
keymap("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab", silent = true, noremap = true })
keymap("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab", silent = true, noremap = true })
keymap("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab", silent = true, noremap = true })
keymap("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab", silent = true, noremap = true })
keymap(
	"n",
	"<leader>tf",
	"<cmd>tabnew %<CR>",
	{ desc = "Open current buffer in new tab", silent = true, noremap = true }
)

-- Lazygit (via snacks.nvim)
keymap("n", "<leader>gg", function()
	require("snacks").lazygit.open()
end, { desc = "Open Lazygit", silent = true, noremap = true })
keymap("n", "<leader>gl", function()
	require("snacks").lazygit.log()
end, { desc = "Open Lazygit Log", silent = true, noremap = true })
keymap("n", "<leader>gf", function()
	require("snacks").lazygit.log_file()
end, { desc = "Open Lazygit Log for Current File", silent = true, noremap = true })

-- Terminal (via snacks.nvim)
keymap("n", "<leader>tt", function()
	require("snacks").terminal.toggle(vim.o.shell)
end, { desc = "Toggle Floating Terminal", silent = true, noremap = true })
keymap("n", "<leader>ts", function()
	require("snacks").terminal.toggle()
end, { desc = "Toggle Split Terminal", silent = true, noremap = true })

-- Hop Management
keymap("n", "<leader>j", "<nop>", { desc = "Hop Motion", silent = true, noremap = true })
keymap("n", "<leader>jw", "<cmd>HopWord<CR>", { desc = "Hop to a word", silent = true, noremap = true })
keymap("n", "<leader>jc", "<cmd>HopCamelCase<CR>", { desc = "Hop to a camelCase word", silent = true, noremap = true })
keymap("n", "<leader>jb", "<cmd>HopChar1<CR>", { desc = "Hop to any character", silent = true, noremap = true })
keymap("n", "<leader>jg", "<cmd>HopChar2<CR>", { desc = "Hop to any bigram", silent = true, noremap = true })
keymap("n", "<leader>jp", "<cmd>HopPattern<CR>", { desc = "Hop via pattern search", silent = true, noremap = true })
keymap("n", "<leader>jl", "<cmd>HopLine<CR>", { desc = "Hop to any line", silent = true, noremap = true })
keymap("n", "<leader>js", "<cmd>HopLineStart<CR>", { desc = "Hop to any line start", silent = true, noremap = true })
keymap("n", "<leader>ja", "<cmd>HopAnywhere<CR>", { desc = "Hop to anywhere", silent = true, noremap = true })
keymap("n", "<leader>jt", "<cmd>HopNodes<CR>", { desc = "Hop to treesitter nodes", silent = true, noremap = true })
keymap("n", "<leader>jv", "<cmd>HopPaste<CR>", { desc = "Paste at hinted position", silent = true, noremap = true })
keymap("n", "<leader>jy", "<cmd>HopYankChar1<CR>", { desc = "Yank to hinted position", silent = true, noremap = true })
keymap("n", "<leader>jm", "<cmd>Hop*MW<CR>", { desc = "Hop across multiple windows", silent = true, noremap = true })

-- Linter & Formatter
keymap("n", "<leader>ll", function()
	require("lint").try_lint()
end, { desc = "Trigger linting", silent = true, noremap = true })
keymap("n", "<leader>mp", function()
	require("conform").format({ lsp_fallback = true, async = false, timeout_ms = 1000 })
end, { desc = "Format file or range", silent = true, noremap = true })

-- FZF-Lua keymaps
keymap("n", "<leader>f", "<nop>", { desc = "Fuzzy Find", silent = true, noremap = true })
keymap("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "Find files", silent = true, noremap = true })
keymap("n", "<leader>fr", "<cmd>FzfLua oldfiles<cr>", { desc = "Find recent files", silent = true, noremap = true })
keymap(
	"n",
	"<leader>fg",
	"<cmd>FzfLua live_grep<cr>",
	{ desc = "Find string in project (Grep)", silent = true, noremap = true }
)
keymap(
	"n",
	"<leader>fw",
	"<cmd>FzfLua grep_cword<cr>",
	{ desc = "Find word under cursor", silent = true, noremap = true }
)
keymap("n", "<leader>fb", "<cmd>FzfLua buffers<cr>", { desc = "Find open buffers", silent = true, noremap = true })
keymap("n", "<leader>gc", "<cmd>FzfLua git_blame<cr>", { desc = "Git blame", silent = true, noremap = true })
keymap(
	"n",
	"<leader>ds",
	"<cmd>FzfLua lsp_document_symbols<cr>",
	{ desc = "Document symbols", silent = true, noremap = true }
)
keymap(
	"n",
	"<leader>dw",
	"<cmd>FzfLua diagnostics_workspace<cr>",
	{ desc = "Workspace diagnostics", silent = true, noremap = true }
)

-- Gitsigns keymaps
keymap("n", "]h", function()
	require("gitsigns").next_hunk()
end, { desc = "Next Hunk", silent = true, noremap = true })
keymap("n", "[h", function()
	require("gitsigns").prev_hunk()
end, { desc = "Prev Hunk", silent = true, noremap = true })
keymap("n", "<leader>gs", function()
	require("gitsigns").stage_hunk()
end, { desc = "Stage hunk", silent = true, noremap = true })
keymap("n", "<leader>gr", function()
	require("gitsigns").reset_hunk()
end, { desc = "Reset hunk", silent = true, noremap = true })
keymap("n", "<leader>gS", function()
	require("gitsigns").stage_buffer()
end, { desc = "Stage buffer", silent = true, noremap = true })
keymap("n", "<leader>grb", function()
	require("gitsigns").reset_buffer()
end, { desc = "Reset buffer", silent = true, noremap = true })
keymap("n", "<leader>gu", function()
	require("gitsigns").undo_stage_hunk()
end, { desc = "Undo stage hunk", silent = true, noremap = true })
keymap("n", "<leader>gp", function()
	require("gitsigns").preview_hunk()
end, { desc = "Preview hunk", silent = true, noremap = true })
keymap("n", "<leader>gb", function()
	require("gitsigns").blame_line({ full = true })
end, { desc = "Blame line", silent = true, noremap = true })
keymap("n", "<leader>gB", function()
	require("gitsigns").toggle_current_line_blame()
end, { desc = "Toggle line blame", silent = true, noremap = true })
keymap("n", "<leader>gdf", function()
	require("gitsigns").diffthis()
end, { desc = "Diff this", silent = true, noremap = true })
keymap("n", "<leader>gD", function()
	require("gitsigns").diffthis("~")
end, { desc = "Diff this ~", silent = true, noremap = true })
keymap("v", "<leader>gs", function()
	require("gitsigns").stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "Stage hunk", silent = true, noremap = true })
keymap("v", "<leader>gr", function()
	require("gitsigns").reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "Reset hunk", silent = true, noremap = true })
keymap(
	{ "o", "x" },
	"ih",
	":<C-U>Gitsigns select_hunk<CR>",
	{ desc = "Select git hunk", silent = true, noremap = true }
)

-- Spectre keymaps
keymap("n", "<leader>s", "<nop>", { desc = "Search / Spectre/ Split", silent = true, noremap = true })
keymap("n", "<leader>ss", "<cmd>Spectre<CR>", { desc = "Open Spectre (Find & Replace)", silent = true, noremap = true })
keymap("n", "<leader>sc", function()
	require("spectre").open_visual({ select_word = true })
end, { desc = "Search current word", silent = true, noremap = true })
keymap("n", "<leader>sp", function()
	require("spectre").open_file_search({ select_word = true })
end, { desc = "Search in current file", silent = true, noremap = true })

-- LSP Keymaps
local lsp_augroup = vim.api.nvim_create_augroup("UserLspKeymaps", { clear = true })
vim.api.nvim_create_autocmd("LspAttach", {
	group = lsp_augroup,
	callback = function(ev)
		local lsp_opts = { buffer = ev.buf, silent = true, noremap = true }

		keymap(
			"n",
			"K",
			vim.lsp.buf.hover,
			vim.tbl_extend("force", lsp_opts, { desc = "LSP: Show Documentation for Cursor" })
		)
		keymap(
			"n",
			"gd",
			"<cmd>FzfLua lsp_definitions<CR>",
			vim.tbl_extend("force", lsp_opts, { desc = "LSP: Go to Definition" })
		)
		keymap(
			"n",
			"gt",
			"<cmd>FzfLua lsp_type_definitions<CR>",
			vim.tbl_extend("force", lsp_opts, { desc = "LSP: Go to Type Definition" })
		)
		keymap(
			"n",
			"gR",
			"<cmd>FzfLua lsp_references<CR>",
			vim.tbl_extend("force", lsp_opts, { desc = "LSP: Show References" })
		)
		keymap(
			"n",
			"gi",
			"<cmd>FzfLua lsp_implementations<CR>",
			vim.tbl_extend("force", lsp_opts, { desc = "LSP: Show Implementations" })
		)
		keymap("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", lsp_opts, { desc = "LSP: Smart Rename" }))
		keymap(
			{ "n", "v" },
			"<leader>ca",
			"<cmd>FzfLua lsp_code_actions<CR>",
			vim.tbl_extend("force", lsp_opts, { desc = "LSP: Show Code Actions" })
		)
		keymap("n", "<leader>rs", ":LspRestart<CR>", vim.tbl_extend("force", lsp_opts, { desc = "LSP: Restart LSP" }))

		-- Diagnostics
		keymap(
			"n",
			"<leader>d",
			vim.diagnostic.open_float,
			vim.tbl_extend("force", lsp_opts, { desc = "LSP: Show Line Diagnostics" })
		)
		keymap(
			"n",
			"<leader>D",
			"<cmd>FzfLua diagnostics_document<CR>",
			vim.tbl_extend("force", lsp_opts, { desc = "LSP: Show Buffer Diagnostics" })
		)
		keymap(
			"n",
			"[d",
			vim.diagnostic.goto_prev,
			vim.tbl_extend("force", lsp_opts, { desc = "LSP: Go to Previous Diagnostic" })
		)
		keymap(
			"n",
			"]d",
			vim.diagnostic.goto_next,
			vim.tbl_extend("force", lsp_opts, { desc = "LSP: Go to Next Diagnostic" })
		)

		-- Spell checking via FZF
		keymap(
			"n",
			"<leader>cm",
			"<cmd>FzfLua spellcheck<CR>",
			vim.tbl_extend("force", lsp_opts, { desc = "LSP: Show Misspelled Words" })
		)
		keymap(
			"n",
			"<leader>cs",
			"<cmd>FzfLua spell_suggest<CR>",
			vim.tbl_extend("force", lsp_opts, { desc = "LSP: Show Spelling Suggestions" })
		)

		keymap("i", "<Tab>", function()
			if require("copilot.suggestion").is_visible() then
				require("copilot.suggestion").accept()
			else
				vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
			end
		end, {
			silent = true,
			desc = "Accept Copilot suggestion or fallback to Tab",
		})

		-- CodeCompanion keymaps (add this section to your keymaps file)
		keymap("n", "<leader>c", "<nop>", { desc = "CodeCompanion / LSP", silent = true, noremap = true })

		-- Main CodeCompanion functions
		keymap(
			{ "n", "v" },
			"<leader>cc",
			"<cmd>CodeCompanionChat Toggle<CR>",
			{ desc = "CodeCompanion: Toggle Chat", silent = true, noremap = true }
		)
		keymap(
			{ "n", "v" },
			"<leader>cp",
			"<cmd>CodeCompanionActions<CR>",
			{ desc = "CodeCompanion: Action Palette", silent = true, noremap = true }
		)

		-- Inline assistance
		keymap(
			{ "n", "v" },
			"<leader>ci",
			"<cmd>CodeCompanion<CR>",
			{ desc = "CodeCompanion: Inline Assistant", silent = true, noremap = true }
		)

		-- Chat functions
		keymap(
			"n",
			"<leader>cn",
			"<cmd>CodeCompanionChat<CR>",
			{ desc = "CodeCompanion: New Chat", silent = true, noremap = true }
		)
		keymap(
			"v",
			"<leader>ca",
			"<cmd>CodeCompanionChat Add<CR>",
			{ desc = "CodeCompanion: Add Selection to Chat", silent = true, noremap = true }
		)

		-- Quick actions with prompt library
		keymap(
			{ "n", "v" },
			"<leader>ce",
			"<cmd>CodeCompanion /explain<CR>",
			{ desc = "CodeCompanion: Explain Code", silent = true, noremap = true }
		)
		keymap(
			{ "n", "v" },
			"<leader>cf",
			"<cmd>CodeCompanion /fix<CR>",
			{ desc = "CodeCompanion: Fix Code", silent = true, noremap = true }
		)
		keymap(
			{ "n", "v" },
			"<leader>co",
			"<cmd>CodeCompanion /optimize<CR>",
			{ desc = "CodeCompanion: Optimize Code", silent = true, noremap = true }
		)

		-- Utility
		keymap("n", "<leader>cP", function()
			-- Paste image from clipboard (requires img-clip.nvim)
			vim.cmd("PasteImage")
		end, { desc = "CodeCompanion: Paste Image for Vision", silent = true, noremap = true })

		-- Command line abbreviation for quick access
		vim.cmd([[cab cc CodeCompanion]])

		-- Line number toggle (add this to your keymaps file)
		keymap("n", "<leader>tn", function()
			if vim.wo.relativenumber then
				vim.wo.relativenumber = false
				vim.wo.number = true
				vim.notify("Switched to absolute line numbers", vim.log.levels.INFO)
			else
				vim.wo.relativenumber = true
				vim.wo.number = true
				vim.notify("Switched to relative line numbers", vim.log.levels.INFO)
			end
		end, { desc = "Toggle relative/absolute line numbers", silent = true, noremap = true })

		-- Fold toggle (add this to your keymaps file)
		keymap("n", "<leader>tf", function()
			if vim.wo.foldenable then
				vim.wo.foldenable = false
				vim.notify("Folds disabled", vim.log.levels.INFO)
			else
				vim.wo.foldenable = true
				vim.wo.foldlevel = 99 -- Keep folds open when re-enabling
				vim.notify("Folds enabled (all open)", vim.log.levels.INFO)
			end
		end, { desc = "Toggle code folding on/off", silent = true, noremap = true })
	end,
})
