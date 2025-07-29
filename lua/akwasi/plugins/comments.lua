return {
	"numToStr/Comment.nvim",
	-- Load plugin on key press
	keys = {
		{ "gcc", mode = "n" },
		{ "gbc", mode = "n" },
		{ "gc", mode = { "n", "v" } },
		{ "gb", mode = { "n", "v" } },
	},
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	opts = {
		-- Add a space between comment and the line
		padding = true,
		-- Whether the cursor should stay at its position
		sticky = true,
		-- LHS of toggle mappings in NORMAL mode
		toggler = {
			line = "gcc",
			block = "gbc",
		},
		-- LHS of operator-pending mappings in NORMAL and VISUAL mode
		opleader = {
			line = "gc",
			block = "gb",
		},
		-- Enable keybindings
		mappings = {
			basic = true,
			extra = true,
		},
	},
	config = function(_, opts)
		local comment = require("Comment")
		local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

		-- Use the pre-defined opts table
		comment.setup(vim.tbl_deep_extend("force", opts, {
			-- for commenting tsx, jsx, svelte, html files
			pre_hook = ts_context_commentstring.create_pre_hook(),
		}))
	end,
}
