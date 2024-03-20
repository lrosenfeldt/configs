-- Set options
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "100"

-- Netrw
vim.g.netrw_keepdir = 1
vim.g.netrw_banner = 0
vim.g.netrw_localcopydircmd = "cp -r"

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = "300" })
	end,
	group = highlight_group,
	pattern = "*",
})

-- add command to toggle virtual text
-- default to false
vim.diagnostic.config({ virtual_text = false })

function VirtualTextToggle()
	local cfg = vim.diagnostic.config()
	vim.diagnostic.config({ virtual_text = not cfg.virtual_text })
end

vim.cmd("command! VirtualText lua VirtualTextToggle()")

-- assume css filetype for .postcss files
vim.filetype.add({
	extension = {
		postcss = "css",
	},
})
