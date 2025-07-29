return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		{ "windwp/nvim-ts-autotag", config = true },
	},
	config = function()
		local ts = require("nvim-treesitter.configs")

		ts.setup({
			ensure_installed = {
				-- Core languages
				"bash",
				"c",
				"cpp",
				"css",
				"dockerfile",
				"gitignore",
				"graphql",
				"html",
				"java",
				"javascript",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"prisma",
				"python",
				"query",
				"rust",
				"scss",
				"sql",
				"svelte",
				"toml",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"yaml",

				-- Additional languages
				"angular",
				"c_sharp",
				"elixir",
				"vue",
			},

			highlight = { enable = true },
			indent = { enable = true },

			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					node_decremental = "<BS>",
					scope_incremental = false,
				},
			},
		})
	end,
}
