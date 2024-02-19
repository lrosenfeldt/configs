return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	cmd = "Telescope",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{
			"<C-p>",
			function()
				require("telescope.builtin").git_files({ show_untracked = true })
			end,
			desc = "Search [p]roject files tracked by git",
		},
		{
			"<leader>pf",
			function()
				require("telescope.builtin").find_files({ hidden = true })
			end,
			desc = "Search [p]roject [f]iles",
		},
		{
			"<leader>ps",
			"<cmd>Telescope live_grep<cr>",
			desc = "[s]earch for grep string in realtime",
		},
		{ "<leader>vh", "<cmd>Telescope help_tags<cr>", desc = "[v]iew [h]elp tags" },
		{ "<leader>vk", "<cmd>Telescope keymaps<cr>", desc = "[v]iew [k]ey maps" },
	},
	opts = {
		defaults = {
			sorting_strategy = "ascending",
			layout_strategy = "vertical",
			border = true,
			prompt_title = "",
			results_title = "",
			preview_title = "",
			-- prompt_prefix = "",
			-- entry_prefix = "",
			-- multi_icon = "",
			color_devicons = false,
			preview = { msg_bg_fillchar = "10" },
			layout_config = {
				anchor = "N",
				width = 0.85,
				height = 0.99,
				preview_height = 0.66,
			},
		},
	},
}