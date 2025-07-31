return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		style = "moon",
		transparent = false,
		terminal_colors = true,
	},
	config = function(_, opts)
		require("tokyonight").setup(opts)
		vim.cmd([[colorscheme tokyonight]])

		-- Set cursor options
		vim.opt.guicursor = "n-v:block-Cursor/lCursor,i-ci-ve:ver25-iCursor/lCursor,r-cr-o:hor20"

		-- Make cursor more transparent
		vim.api.nvim_set_hl(0, "Cursor", { fg = "#c0caf5", bg = "#7aa2f7", blend = 30 })
		vim.api.nvim_set_hl(0, "lCursor", { fg = "#c0caf5", bg = "#7aa2f7", blend = 30 })
		vim.api.nvim_set_hl(0, "iCursor", { fg = "#c0caf5", bg = "#bb9af7", blend = 30 })
	end,
}
