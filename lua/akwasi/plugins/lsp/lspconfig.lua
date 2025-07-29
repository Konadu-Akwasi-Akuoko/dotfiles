return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"saghen/blink.cmp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/lazydev.nvim", opts = {} },
	},
	config = function()
		vim.diagnostic.config({
			virtual_lines = {
				only_current_line = false,
				highlight_whole_line = false,
				wrap = true,
			},
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = " ",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.HINT] = "󰠠 ",
					[vim.diagnostic.severity.INFO] = " ",
				},
			},
		})

		local capabilities = require("blink.cmp").get_lsp_capabilities()
		local util = require("lspconfig.util")

		vim.lsp.config("*", {
			capabilities = capabilities,
		})

		-- A function that creates the biome config file(biome.json) for when it doesn't exist, in a project root_dir
		local function ensure_biome_config()
			local data_dir = vim.fn.stdpath("data")
			local biome_config_path = data_dir .. "/biome.json"

			if vim.fn.filereadable(biome_config_path) == 0 then
				local biome_config = [[
					{
						"$schema": "https://biomejs.dev/schemas/2.1.2/schema.json",
						"linter": {
							"enabled": true,
							"rules": {
							"recommended": true
							}
						}
					}
				]]
				vim.fn.writefile(vim.split(biome_config, "\n"), biome_config_path)
			end

			return biome_config_path
		end

		vim.lsp.config("biome", {
			cmd = function(dispatchers, config)
				local cmd = "biome"
				local local_cmd = (config or {}).root_dir and config.root_dir .. "/node_modules/.bin/biome"
				if local_cmd and vim.fn.executable(local_cmd) == 1 then
					cmd = local_cmd
				end
				return vim.lsp.rpc.start({ cmd, "lsp-proxy" }, dispatchers)
			end,
			filetypes = {
				"astro",
				"css",
				"graphql",
				"html",
				"javascript",
				"javascriptreact",
				"json",
				"jsonc",
				"svelte",
				"typescript",
				"typescript.tsx",
				"typescriptreact",
				"vue",
			},
			workspace_required = false,
			root_dir = function(_, on_dir)
				local cwd = vim.fn.getcwd()
				local root_files = { "biome.json", "biome.jsonc" }
				root_files = util.insert_package_json(root_files, "biome", cwd)

				local found_files = vim.fs.find(root_files, { path = cwd, upward = true })

				if #found_files > 0 then
					local root_dir = vim.fs.dirname(found_files[1])
					on_dir(root_dir)
				else
					on_dir(cwd)
				end
			end,
			init_options = {
				configPath = ensure_biome_config(),
			},
		})

		-- Set up TypeScript Language Server
		vim.lsp.config("ts_ls", {
			filetypes = {
				"typescript",
				"javascript",
				"javascriptreact",
				"javascript.jsx",
				"typescriptreact",
				"typescript.tsx",
			},
			settings = {
				typescript = {
					updateImportsOnFileMove = { enabled = "always" },
					suggest = {
						completeFunctionCalls = true,
					},
				},
				javascript = {
					updateImportsOnFileMove = { enabled = "always" },
				},
			},
		})

		-- SETTING UP VUE LANGUAGE SERVER
		-- Get Vue Language Server path from Mason
		local vue_language_server_path = vim.fn.stdpath("data")
			.. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

		-- Configure Vue TypeScript plugin for vtsls
		local vue_plugin = {
			name = "@vue/typescript-plugin",
			location = vue_language_server_path,
			languages = { "vue" },
			configNamespace = "typescript",
		}

		-- Configure vtsls (TypeScript server with Vue plugin)
		vim.lsp.config("vtsls", {
			settings = {
				vtsls = {
					enableMoveToFileCodeAction = true,
					autoUseWorkspaceTsdk = true,
					tsserver = {
						globalPlugins = {
							vue_plugin,
						},
					},
				},
				typescript = {
					updateImportsOnFileMove = { enabled = "always" },
					suggest = {
						completeFunctionCalls = true,
					},
				},
				javascript = {
					updateImportsOnFileMove = { enabled = "always" },
				},
			},
			filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
		})

		-- Configure Vue Language Server
		vim.lsp.config("vue_ls", {
			-- Using the default config for Vue Language Server on nvim-lspconfig, Mason does that
			settings = {
				vue = {
					complete = {
						casing = {
							tags = "pascal",
							attributes = "camel",
						},
					},
					validation = {
						template = true,
						style = true,
						script = true,
					},
					format = {
						enable = true,
					},
				},
			},
		})

		-- Set up semantic token support for Vue components
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local client = vim.lsp.get_client_by_id(args.data.client_id)
				if client and client.name == "vue_ls" then
					if client.server_capabilities.semanticTokensProvider then
						client.server_capabilities.semanticTokensProvider.full = true
					end
				end
			end,
		})
	end,
}
