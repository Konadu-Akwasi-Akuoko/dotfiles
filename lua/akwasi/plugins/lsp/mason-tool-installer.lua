return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = {
		"mason-org/mason.nvim",
	},
	opts = {
		ensure_installed = {

			-- Formatters
			"prettier",
			"stylua",
			"biome",

			-- Linters
			"eslint",
			"stylelint",

			-- other tools
			"codespell",
		},
		auto_update = true,
		run_on_start = true,
	},
}
