local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		-- {
		-- "LazyVim/LazyVim", import = "lazyvim.plugins" },
		-- { import = "lazyvim.plugins.extras.linting.eslint" },
		-- { import = "lazyvim.plugins.extras.lang.java" },
		-- { import = "plugins" },
		-- { import = "lazyvim.plugins.extras.lang.angular" },
		{ import = "akwasi.plugins" },
		{ import = "akwasi.plugins.lsp" },
		{ import = "akwasi.plugins.dap" },
	},
}, {
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = true,
	},
})
