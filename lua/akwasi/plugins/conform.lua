return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		formatters = {
			-- You can add custom configuration for codespell if needed
			-- codespell = {
			--     args = { "--check-hidden", "--builtin", "clear,rare,code", "--quiet-level", "2", "-" },
			-- },
		},
		formatters_by_ft = {
			javascript = { "prettier" },
			typescript = { "prettier" },
			javascriptreact = { "prettier" },
			typescriptreact = { "prettier" },
			svelte = { "prettier" },
			vue = { "prettier" },
			css = { "prettier" },
			html = { "prettier" },
			json = { "prettier" },
			yaml = { "prettier" },
			graphql = { "prettier" },
			liquid = { "prettier" },
			lua = { "stylua" },
			-- ["*"] = { "codespell" },
		},
		format_on_save = {
			lsp_fallback = true,
			async = false,
			timeout_ms = 2500,
		},
	},
}
