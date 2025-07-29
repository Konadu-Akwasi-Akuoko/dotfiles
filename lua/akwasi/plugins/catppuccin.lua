return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {
		flavour = "mocha",
		integrations = {
			cmp = true,
			gitsigns = true,
			nvimtree = true,
			treesitter = true,
			notify = false,
		},
		-- This function allows you to override or add new highlight groups
		custom_highlights = function(colors)
			local u = require("catppuccin.utils.colors")
			return {
				-- Make the word under the cursor more obvious
				MiniCursorword = { bg = colors.overlay0 },
				-- Custom CursorLine styling
				CursorLine = {
					bg = u.vary_color(
						{ latte = u.lighten(colors.mantle, 0.70, colors.base) },
						u.darken(colors.surface0, 0.64, colors.base)
					),
				},
				-- Add these cursor highlight groups
				Cursor = { fg = colors.base, bg = colors.blue }, -- Normal mode cursor
				iCursor = { fg = colors.base, bg = colors.pink }, -- Insert mode cursor
			}
		end,
	},
	config = function(_, opts)
		require("catppuccin").setup(opts)
		vim.cmd.colorscheme("catppuccin")

		-- Set cursor options after colorscheme is loaded
		vim.opt.guicursor = "n-v:block-Cursor/lCursor,i-ci-ve:ver25-iCursor/lCursor,r-cr-o:hor20"
	end,
}
