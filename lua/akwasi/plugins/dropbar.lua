return {
	"Bekaboo/dropbar.nvim",
	-- optional, but required for fuzzy finder support
	dependencies = {
		"nvim-telescope/telescope-fzf-native.nvim",
	},
	config = function()
		require("dropbar")

		vim.g.mapleader = " "
		local keymap = vim.keymap

		function open_fuzzy_finder()
			require("dropbar.api").fuzzy_find_toggle()
		end

		-- Map a key to open fuzzy finder mode, when drobar is toggled
		keymap.set("n", "f", ":lua open_fuzzy_finder()<CR>", { noremap = true, silent = true })
	end,
}
