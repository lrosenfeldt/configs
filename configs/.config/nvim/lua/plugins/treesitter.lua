local function disableTS(_lang, buf)
	local max_filesize = 100 * 1024 -- 100 KB
	local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
	if ok and stats and stats.size > max_filesize then
		return true
	end
end

return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		keys = {
			{ "<c-space>", desc = "Increment selection" },
			{ "<bs>", desc = "Decrement selection", mode = "x" },
		},
    branch = "fix/matches",
		config = function()
			-- Add languages that you want to be installed
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					-- should always be installed
					"c",
					"lua",
					"vim",
					"vimdoc",
					"query",
					-- custom parsers
					"bash",
					"css",
					"fish",
					"git_config",
					"html",
					"javascript",
					"jsdoc",
					"json",
					"json5",
					"jsonc",
					"scss",
					"tsx",
					"typescript",
					"vue",
					"yaml",
				},
				sync_install = false,
				-- Auto-installl languages that are not installed
				auto_install = true,
				ignore_install = {},
				highlight = {
					enable = true,
					disable = disableTS,
					additional_vim_regex_highlighting = false,
				},
				incremental_selection = {
					enable = true,
					disable = disableTS,
					keymaps = {
						init_selection = "<c-space>",
						node_incremental = "<c-space>",
						scope_incremental = "<c-s>",
						node_decremental = "<bs>",
					},
				},
				indent = { enable = false },
			})
		end,
	},
	{ "JoosepAlviste/nvim-ts-context-commentstring" },
}
