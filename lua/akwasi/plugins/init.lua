return {
	-- Utility library required by many plugins.
	{ "nvim-lua/plenary.nvim" },
	-- Seamless navigation between Neovim splits and Tmux panes.
	-- This plugin must be loaded at startup to set the necessary global keymaps.
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},
}
