return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	version = false,
	build = vim.fn.has("win32") ~= 0 and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
		or "make",
	dependencies = {
		-- Required dependencies
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
		"zbirenbaum/copilot.lua",

		-- File selector (choose one based on your preference)
		"ibhagwan/fzf-lua", -- using fzf-lua as requested

		-- Input provider (using snacks as requested)
		"folke/snacks.nvim",

		{
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = {
						insert_mode = true,
					},
					use_absolute_path = true,
				},
			},
		},
		{
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
	opts = {
		provider = "copilot",
		behaviour = {
			auto_suggestions = false,
			auto_set_highlight_group = true,
			auto_set_keymaps = true,
			auto_apply_diff_after_generation = false,
			support_paste_from_clipboard = false,
			minimize_diff = true,
			enable_token_counting = true,
			auto_approve_tool_permissions = false,
		},
		web_search_engine = {
			provider = "tavily",
			proxy = "nil",
			api_key = "TAVILY_API_KEY",
		},
		-- Provider configurations use sensible defaults
		-- Only customize if you need to override specific settings
		mappings = {
			diff = {
				ours = "co",
				theirs = "ct",
				all_theirs = "ca",
				both = "cb",
				cursor = "cc",
				next = "]x",
				prev = "[x",
			},
			suggestion = {
				accept = "<M-l>",
				next = "<M-]>",
				prev = "<M-[>",
				dismiss = "<C-]>",
			},
			jump = {
				next = "]]",
				prev = "[[",
			},
			submit = {
				normal = "<CR>",
				insert = "<C-s>",
			},
			cancel = {
				normal = { "<C-c>", "<Esc>", "q" },
				insert = { "<C-c>" },
			},
			sidebar = {
				apply_all = "A",
				apply_cursor = "a",
				retry_user_request = "r",
				edit_user_request = "e",
				switch_windows = "<Tab>",
				reverse_switch_windows = "<S-Tab>",
				remove_file = "d",
				add_file = "@",
				close = { "<Esc>", "q" },
			},
		},
		windows = {
			position = "right",
			wrap = true,
			width = 30,
			sidebar_header = {
				enabled = true,
				align = "center",
				rounded = true,
			},
			input = {
				prefix = "> ",
				height = 8,
			},
			edit = {
				border = "rounded",
				start_insert = true,
			},
			ask = {
				floating = false,
				start_insert = true,
				border = "rounded",
				focus_on_apply = "ours",
			},
		},
		highlights = {
			diff = {
				current = "DiffText",
				incoming = "DiffAdd",
			},
		},
		diff = {
			autojump = true,
			list_opener = "copen",
			override_timeoutlen = 500,
		},
		selector = {
			provider = "fzf_lua", -- using fzf-lua as file selector
			provider_opts = {},
		},
		input = {
			provider = "snacks", -- using snacks for input as requested
			provider_opts = {
				title = "Avante Input",
				icon = " ",
				placeholder = "Enter your input...",
			},
		},
	},
	config = function(_, opts)
		require("copilot").setup({
			suggestion = { enabled = false },
			panel = { enabled = false },
		})
		require("avante").setup(opts)
	end,
}
