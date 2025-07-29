return {
	"nvim-pack/nvim-spectre",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- For icons
	},
	cmd = "Spectre",
	opts = {
		open_cmd = "noswapfile vnew", -- Prevent swap file warnings
		live_update = false, -- Don't update automatically while typing
		lnum_for_results = true, -- Show line numbers in results
		is_insert_mode = false, -- Start in normal mode for immediate searching
		is_block_ui_break = true, -- Prevent UI breaks with special key mappings
		mapping = {
			["send_to_qf"] = {
				map = "<leader>q",
				cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
				desc = "send all items to quickfix",
			},
			["run_replace"] = {
				map = "<leader>R",
				cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
				desc = "replace all",
			},
			["change_view_mode"] = {
				map = "<leader>v",
				cmd = "<cmd>lua require('spectre').change_view()<CR>",
				desc = "change result view mode",
			},
			["toggle_ignore_case"] = {
				map = "ti",
				cmd = "<cmd>lua require('spectre').change_options('ignore-case')<CR>",
				desc = "toggle ignore case",
			},
		},
		default = {
			find = {
				cmd = "rg",
				options = { "ignore-case" },
			},
			replace = {
				-- Use sed for replacement, make sure to have it installed, macos: `brew install gnu-sed`
				cmd = "sed",
			},
		},
	},
}
