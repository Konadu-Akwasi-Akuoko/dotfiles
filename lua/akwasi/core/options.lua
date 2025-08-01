vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
opt.wrap = true -- enable line wrapping
opt.linebreak = true -- enable text to move down the line, if it is affected by line wrap

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- appearance

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false

-- spell checker settings
opt.spell = true
opt.spelllang = "en_us"
opt.spelloptions = "camel"

-- Set up folding to always be enabled but open by default
vim.opt.foldenable = true -- Enable folding
vim.opt.foldmethod = "indent" -- Use indent-based folding (reliable for all files)
vim.opt.foldlevelstart = 99 -- Start with all folds open
vim.opt.foldlevel = 99 -- Keep folds open by default

-- views can only be fully collapsed with the global statusline
vim.opt.laststatus = 3

-- highlight yank
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlighting when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlighting-yank", {
		clear = true,
	}),
	callback = function()
		vim.highlight.on_yank()
	end,
})
