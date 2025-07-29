return {
	"ibhagwan/fzf-lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	cmd = "FzfLua",
	opts = {
		winopts = {
			preview = {
				-- make sure to have `bat` installed for previewing files, macos: `brew install bat`
				default = "bat",
			},
		},
		lsp = {
			-- Customize LSP features for better experience
			code_actions = {
				previewer = "codeaction_native",
				-- Use delta for better code action previews, macos: `brew install git-delta`
				preview_pager = "delta --side-by-side --width=$FZF_PREVIEW_COLUMNS",
			},
			symbols = {
				path_shorten = 1, -- Shorten path in symbols view
			},
		},
	},
	config = function(_, opts)
		local fzf_lua = require("fzf-lua")
		fzf_lua.setup(opts)

		-- Register FzfLua as the UI select provider
		fzf_lua.register_ui_select()
	end,
}
