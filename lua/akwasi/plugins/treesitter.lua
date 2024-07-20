return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		-- import nvim-treesitter plugin
		local treesitter = require("nvim-treesitter.configs")

		-- configure treesitter
		treesitter.setup({ -- enable syntax highlighting
			highlight = {
				enable = true,
			},
			-- enable indentation
			indent = { enable = true },
			-- enable autotagging (w/ nvim-ts-autotag plugin) - the below is deprecated
			-- autotag = {
			-- 	enable = true,
			-- 	filetypes = {
			-- 		"html",
			-- 		"javascript",
			-- 		"typescript",
			-- 		"javascriptreact",
			-- 		"typescriptreact",
			-- 		"svelte",
			-- 		"vue",
			-- 		"tsx",
			-- 		"jsx",
			-- 		"rescript",
			-- 		"css",
			-- 		"lua",
			-- 		"xml",
			-- 		"php",
			-- 		"markdown",
			-- 	},
			-- },
			-- ensure these language parsers are installed
			ensure_installed = {
				"json",
				"javascript",
				"typescript",
				"tsx",
				"yaml",
				"html",
				"css",
				"prisma",
				"markdown",
				"markdown_inline",
				"svelte",
				"graphql",
				"bash",
				"lua",
				"vim",
				"dockerfile",
				"gitignore",
				"query",
				"vimdoc",
				"c",
				-- personal, added by Akwasi
				"angular",
				"c_sharp",
				"cpp",
				"elixir",
				"java",
				"markdown",
				"python",
				"rust",
				"scss",
				"sql",
				"toml",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		})

		require("nvim-ts-autotag").setup({
			opts = {
				-- Defaults
				enable_close = true, -- Auto close tags
				enable_rename = true, -- Auto rename pairs of tags
				enable_close_on_slash = false, -- Auto close on trailing </
				filetypes = {
					"html",
					"javascript",
					"typescript",
					"javascriptreact",
					"typescriptreact",
					"svelte",
					"vue",
					"tsx",
					"jsx",
					"rescript",
					"css",
					"lua",
					"xml",
					"php",
					"markdown",
				},
			},
		})
	end,
}
