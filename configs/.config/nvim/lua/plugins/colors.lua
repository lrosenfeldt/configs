return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 9000,
		config = function()
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	-- { "NLKNguyen/papercolor-theme", priority = 9000 },
	-- Theme inspired by Atom
	-- { "Mofiqul/vscode.nvim", priority = 9000 },
}
