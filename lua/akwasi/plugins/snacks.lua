return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		-- animate = {
		-- enabled = true,
		-- },
		-- image = {
		-- 	enabled = true,
		-- 	-- Configure for CodeCompanion compatibility
		-- 	integrations = {
		-- 		markdown = {
		-- 			enabled = true,
		-- 			filetypes = { "markdown", "codecompanion" },
		-- 		},
		-- 	},
		-- },
		input = {
			enabled = true,
		},
		scroll = {
			enabled = true,
		},
		indent = {
			enabled = true,
		},
		scope = {
			enabled = true,
		},
		dashboard = {
			enabled = true,
		},
		lazygit = {
			enabled = true,
		},
		terminal = {
			enabled = true,
		},
		statuscolumn = {
			enabled = true,
			left = { "mark", "sign" }, -- priority of signs on the left (high to low)
			right = { "fold", "git" }, -- priority of signs on the right (high to low)
			folds = {
				open = true, -- show open fold icons
				git_hl = true, -- use Git Signs hl for fold icons
			},
		},
	},
}
