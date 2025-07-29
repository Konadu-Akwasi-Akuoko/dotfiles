return {
	"windwp/windline.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim",
	},
	config = function()
		require("wlsample.vscode")
	end,
}
