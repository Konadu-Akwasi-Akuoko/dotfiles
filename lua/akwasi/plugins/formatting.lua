return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	-- opts = {
	-- 	formatters = {
	-- 		formatters = {
	-- 			["markdown-toc"] = {
	-- 				condition = function(_, ctx)
	-- 					for _, line in ipairs(vim.api.nvim_buf_get_lines(ctx.buf, 0, -1, false)) do
	-- 						if line:find("<!%-%- toc %-%->") then
	-- 							return true
	-- 						end
	-- 					end
	-- 				end,
	-- 			},
	-- 			["markdownlint-cli2"] = {
	-- 				condition = function(_, ctx)
	-- 					local diag = vim.tbl_filter(function(d)
	-- 						return d.source == "markdownlint"
	-- 					end, vim.diagnostic.get(ctx.buf))
	-- 					return #diag > 0
	-- 				end,
	-- 			},
	-- 		},
	-- 		formatters_by_ft = {
	-- 			["markdown"] = { "prettier", "markdownlint-cli2", "markdown-toc" },
	-- 			["markdown.mdx"] = { "prettier", "markdownlint-cli2", "markdown-toc" },
	-- 		},
	-- 	},
	-- },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters = {
				["markdown-toc"] = {
					condition = function(_, ctx)
						for _, line in ipairs(vim.api.nvim_buf_get_lines(ctx.buf, 0, -1, false)) do
							if line:find("<!%-%- toc %-%->") then
								return true
							end
						end
					end,
				},
				["markdownlint-cli2"] = {
					condition = function(_, ctx)
						local diag = vim.tbl_filter(function(d)
							return d.source == "markdownlint"
						end, vim.diagnostic.get(ctx.buf))
						return #diag > 0
					end,
				},
			},

			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				svelte = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				-- markdown = { "prettier" },
				graphql = { "prettier" },
				liquid = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
				["markdown"] = { "prettier", "markdownlint-cli2", "markdown-toc" },
				["markdown.mdx"] = { "prettier", "markdownlint-cli2", "markdown-toc" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 2500,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
