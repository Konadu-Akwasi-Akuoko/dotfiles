return {
	"ibhagwan/fzf-lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {},
	config = function()
		local fzf = require("fzf-lua")
		fzf.setup({
			--[[ 			{ "telescope" }, ]]
			-- Optionally override some defaults
			--[[ winopts = {
				preview = {
					default = "bat",
				},
			}, ]]
		})

		local keymap = vim.keymap
		-- Replace Telescope bindings with fzf-lua
		keymap.set("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "Fuzzy find files" })
		keymap.set("n", "<leader>fr", "<cmd>FzfLua oldfiles<cr>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>fs", "<cmd>FzfLua live_grep<cr>", { desc = "Find string in cwd" })
		keymap.set("n", "<leader>fc", "<cmd>FzfLua grep_cword<cr>", { desc = "Find word under cursor" })
		keymap.set("n", "<leader>bb", "<cmd>FzfLua buffers<cr>", { desc = "Show opened buffers" })

		-- Git shortcuts
		keymap.set("n", "<leader>gc", "<cmd>FzfLua git_blame<cr>", { desc = "Git changes blame" })
	end,
}
