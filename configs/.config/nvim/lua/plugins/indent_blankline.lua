return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {
		exclude = {
			filetypes = {
				"help",
				"checkhealth",
				"dashboard",
				"lazy",
				"lspinfo",
				"man",
				"mason",
				"netrw",
			},
		},
		indent = {
			char = "┊",
		},
		scope = {
			enabled = false,
		},
	},
}
