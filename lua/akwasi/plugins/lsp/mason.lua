return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"mfussenegger/nvim-lint",
		"rshkarin/mason-nvim-lint",
		-- "nvim-java/nvim-java",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		local mason_nvim_lint = require("mason-nvim-lint")

		-- Setup nvim-java
		-- require("java").setup()
		-- require("lspconfig").jdtls.setup({})

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"angularls@17.3.2",
				"ts_ls",
				"html",
				"cssls",
				"tailwindcss",
				"svelte",
				"lua_ls",
				"graphql",
				"emmet_ls",
				"prismals",
				"pyright",
				"jdtls",
				"marksman",
				-- "java_language_server",
				"volar",
				-- "vuels", -- deprecated using volar instead
				-- "tsserver", same as ts_ls
				-- "rust_analyzer", if you are using rustaceanvim you will need to install rust_analyzer directly using rustup, cause rusta does not play well with mason.lspconfig of rust_analyzer. so install it using: `rustup component add rust-analyzer`
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				-- "isort", -- python formatter
				-- "black", -- python formatter,
				-- "pylint", -- python linter
				"eslint_d", -- js linter
				"markdownlint-cli2",
				"markdown-toc",
				"codelldb", -- codelldb debugger for rustaceanvim
			},
		})

		mason_nvim_lint.setup({
			ensure_installed = {
				"markdownlint-cli2",
				"markdown-toc",
			},
		})
	end,
}
