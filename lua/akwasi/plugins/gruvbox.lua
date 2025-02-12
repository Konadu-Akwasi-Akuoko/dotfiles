return {
	{
		"luisiacc/gruvbox-baby",
		branch = "main",
		init = function()
			-- Set background to dark
			vim.g.gruvbox_baby_background_color = "dark"

			-- You can add other configurations here too, for example:
			-- vim.g.gruvbox_baby_function_style = "NONE"
			vim.g.gruvbox_baby_keyword_style = "italic"
			vim.g.gruvbox_baby_telescope_theme = 1
			-- vim.g.gruvbox_baby_transparent_mode = 1
		end,
		config = function()
			vim.cmd.colorscheme("gruvbox-baby")
		end,
	},
}
