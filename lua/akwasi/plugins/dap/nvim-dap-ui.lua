return {
	"rcarriga/nvim-dap-ui",
	dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
	lazy = true,
	ft = "rust",
	config = function()
		require("dapui").setup()
	end,
}
