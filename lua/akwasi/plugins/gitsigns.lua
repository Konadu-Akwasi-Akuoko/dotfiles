return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		current_line_blame = true, -- Enable blame on the current line
		current_line_blame_opts = {
			delay = 500, -- Delay before showing blame
			virt_text_pos = "eol", -- Position of the virtual text
		},
	},
}
