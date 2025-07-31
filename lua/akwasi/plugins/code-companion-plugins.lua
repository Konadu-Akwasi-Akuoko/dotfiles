return {

	-- 1. Markdown rendering for better chat buffer display
	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = { "markdown", "codecompanion" },
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("render-markdown").setup({
				file_types = { "markdown", "codecompanion" },
			})
		end,
	},

	-- 2. Better diff visualization for inline edits
	{
		"echasnovski/mini.diff",
		config = function()
			local diff = require("mini.diff")
			diff.setup({
				-- Start with no source, enable when needed
				source = diff.gen_source.none(),
			})
		end,
	},

	-- 3. Image clipboard support for vision models
	{
		"HakonHarnes/img-clip.nvim",
		opts = {
			filetypes = {
				codecompanion = {
					prompt_for_file_name = false,
					template = "[Image]($FILE_PATH)",
					use_absolute_path = true,
				},
			},
		},
	},

	-- 4. Better UI elements (already recommended for other plugins)
	{
		"stevearc/dressing.nvim",
		opts = {},
	},
}
