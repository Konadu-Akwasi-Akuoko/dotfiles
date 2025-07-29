return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		-- Disable netrw to ensure nvim-tree is the default file explorer
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		local nvimtree = require("nvim-tree")
		nvimtree.setup({
			-- Automatically find and highlight the current file in the tree
			update_focused_file = {
				enable = true,
			},
			view = {
				width = 35,
				-- Note: relativenumber can have a minor performance cost
				relativenumber = true,
			},
			renderer = {
				indent_markers = {
					enable = true,
				},
				icons = {
					glyphs = {
						folder = {
							arrow_closed = "", -- Customized: remove arrow for closed folders
							arrow_open = "", -- Customized: remove arrow for open folders
						},
					},
				},
			},
			filters = {
				dotfiles = false, -- Set to false to show dotfiles like .env
				custom = { ".DS_Store" }, -- Keep filtering out .DS_Store files
			},
			-- git integration is on by default, no need for `git.ignore = false`
		})
	end,
}
