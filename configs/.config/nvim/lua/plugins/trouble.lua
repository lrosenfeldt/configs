return {
	"folke/trouble.nvim",
	cmd = "TroubleToggle",
	keys = {
		{
			"<leader>xq",
			"<cmd>TroubleToggle quickfix<cr>",
			desc = "Trouble: toggle [q]uickfix",
			silent = true,
			noremap = true,
		},
		{
			"<leader>xw",
			"<cmd>TroubleToggle workspace_diagnostics<cr>",
			desc = "Trouble: toggle [w]orkspace diagnostics",
			silent = true,
			noremap = true,
		},
	},
	opts = {
		icons = false,
		fold_open = "v", -- icon used for open folds
		fold_closed = ">", -- icon used for closed folds
		indent_lines = false, -- add an indent guide below the fold icons
		signs = {
			-- icons / text used for a diagnostic
			error = "E",
			warning = "W",
			hint = "H",
			information = "I",
		},
		use_diagnostic_signs = false, -- enabling this will use the signs defined in your lsp client
	},
}
