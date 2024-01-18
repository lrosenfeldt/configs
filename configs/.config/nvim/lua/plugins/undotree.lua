return {
	"mbbill/undotree",
	keys = {
		{ "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Toggle [u]ndo tree" },
		additional_vim_regex_highlighting = false,
	},
	config = function()
		vim.g.undotree_ShortIndicators = 1 -- only show short timestamps
		vim.g.undotree_SetFocusWhenToggle = 1
		vim.g.undotree_WindowLayout = 2
	end,
}
