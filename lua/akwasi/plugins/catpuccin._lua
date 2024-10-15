return {
	"catppuccin/nvim",
	name = "catppuccin",
	config = function()
		require("catppuccin").setup({
			flavour = "macchiato",
			transparent_background = true,
		})
		-- setup must be called before loading
		vim.cmd.colorscheme("catppuccin")
	end,
	priority = 1000,
}
