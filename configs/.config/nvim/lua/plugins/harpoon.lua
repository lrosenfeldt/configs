return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		"<leader>hm",
		"<leader>ht",
		"<C-h>",
		"<C-j>",
		"<C-k>",
		"<C-l>",
	},
  opts = {
    settings = {
      save_on_toggle = true,
      sync_on_ui_close = true,
    },
  },
	config = function(_, opts)
		local harpoon = require("harpoon")

		harpoon:setup(opts)

		vim.keymap.set("n", "<leader>hm", function()
			harpoon:list():add()
		end)
		vim.keymap.set("n", "<leader>ht", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		vim.keymap.set("n", "<C-h>", function()
			harpoon:list():select(1)
		end)
		vim.keymap.set("n", "<C-j>", function()
			harpoon:list():select(2)
		end)
		vim.keymap.set("n", "<C-k>", function()
			harpoon:list():select(3)
		end)
		vim.keymap.set("n", "<C-l>", function()
			harpoon:list():select(4)
		end)
	end,
}
