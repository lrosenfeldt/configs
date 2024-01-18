return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{
			"<leader>hm",
			function()
				require("harpoon.mark").add_file()
			end,
			desc = "(Harpoon) [m]ark file",
		},
		{
			"<leader>ht",
			function()
				require("harpoon.ui").toggle_quick_menu()
			end,
			desc = "(Harpoon) [t]oggle quick menu",
		},
		{
			"<C-h>",
			function()
				require("harpoon.ui").nav_file(1)
			end,
			desc = "(Harpoon) jump to first file",
		},
		{
			"<C-j>",
			function()
				require("harpoon.ui").nav_file(2)
			end,
			desc = "(Harpoon) jump to second file",
		},
		{
			"<C-k>",
			function()
				require("harpoon.ui").nav_file(3)
			end,
			desc = "(Harpoon) jump to third file",
		},
		{
			"<C-l>",
			function()
				require("harpoon.ui").nav_file(4)
			end,
			desc = "(Harpoon) jump to fourth file",
		},
	},
	opts = {
		menu = {
			width = 80,
		},
	},
}
