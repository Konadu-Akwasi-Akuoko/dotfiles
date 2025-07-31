return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"ibhagwan/fzf-lua", -- For file selection
		"stevearc/dressing.nvim", -- Better UI elements
	},
	config = function()
		require("codecompanion").setup({
			strategies = {
				chat = {
					adapter = "copilot",
				},
				inline = {
					adapter = "copilot",
				},
			},
			opts = {
				log_level = "ERROR", -- Set to "DEBUG" for troubleshooting
			},
		})
	end,
}
