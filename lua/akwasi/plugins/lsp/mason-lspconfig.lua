return {
	"mason-org/mason-lspconfig.nvim",
	dependencies = {
		"mason-org/mason.nvim",
		"neovim/nvim-lspconfig",
	},
	opts = {
		ensure_installed = {
			"biome",
			"ts_ls",
			"lua_ls",
			"vtsls",
			"vue_ls",
			"html",
			"emmet_ls",
			"cssls",
			"tailwindcss",
			"marksman",
		},
	},
}
