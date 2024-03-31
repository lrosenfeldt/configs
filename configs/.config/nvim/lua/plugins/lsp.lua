local on_attach = function(_, bufnr)
	-- define mappings specific for LSP stuff.
	-- It sets the mode, buffer and description for us each time.
	local nmap = function(keys, action, desc)
		if desc then
			desc = "(LSP) " .. desc
		end

		vim.keymap.set("n", keys, action, { buffer = bufnr, desc = desc })
	end

	nmap("<leader>rn", vim.lsp.buf.rename, "[r]e[n]ame symbol")
	nmap("<leader>ca", vim.lsp.buf.code_action, "[c]ode [a]ction")
	nmap("gd", vim.lsp.buf.definition, "[G]oto [d]efinition")
	nmap("gr", function()
		require("telescope.builtin").lsp_references()
	end, "[G]oto [R]eferences")
	nmap("gI", vim.lsp.buf.implementation, "[g]oto [I]mplementation")
	nmap("gy", vim.lsp.buf.type_definition, "[g]oto t[y]pe definition")
	--
	-- See `:help K` for why this keymap
	nmap("K", vim.lsp.buf.hover, "Hover Documentation, see `:help K` for the why")
	-- TODO: think of better keymap, 'k' is always so nice for movements
	vim.keymap.set(
		"i",
		"<C-k>",
		vim.lsp.buf.signature_help,
		{ buffer = bufnr, desc = "(LSP): Signature Documentation" }
	)

	-- Lesser used LSP functionality
	nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

	-- Create a command `:Format` local to the LSP buffer
	vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
		vim.lsp.buf.format({
			filter = function(client)
				-- never use volar
				return client.name ~= "volar"
			end,
			timeout_ms = 3000,
		})
	end, { desc = "Format currrent buffer with LSP" })

	nmap("<leader>f", "<cmd>Format<cr>", "Format current buffer")
end

-- NOTE: This is where my plugins related to LSP can be installed
return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", config = true },
		{ "williamboman/mason-lspconfig.nvim", config = true },
		"nvimtools/none-ls.nvim",
		"jay-babu/mason-null-ls.nvim",
	},
	config = function()
		-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
		local capabilites = vim.lsp.protocol.make_client_capabilities()
		capabilites = require("cmp_nvim_lsp").default_capabilities()

		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"cssls",
				"eslint",
				"gopls",
				"jdtls",
				"jsonls",
				"lua_ls",
				"volar",
				"yamlls",
			},
		})

		-- :help mason-lspconfig-automatic-server-setup
		require("mason-lspconfig").setup_handlers({
			-- The first entry (without a key) will be the default handler
			-- and will be called for each installed server that doesn't have
			-- a dedicated handler.
			function(server_name)
				require("lspconfig")[server_name].setup({
					capabilities = capabilites,
					on_attach = on_attach,
				})
			end,
			["volar"] = function()
				require("lspconfig").volar.setup({
					capabilities = capabilites,
					on_attach = on_attach,
					filetypes = {
						"typescript",
						"javascript",
						"javascriptreact",
						"typescriptreact",
						"vue",
						"json",
					},
					settings = {},
				})
			end,
			["lua_ls"] = function()
				require("lspconfig").lua_ls.setup({
					capabilities = capabilites,
					on_attach = on_attach,
					telemetry = { enable = false },
				})
			end,
		})

		-- none-ls stuff
		local none_ls = require("null-ls")

		none_ls.setup({
			sources = {
				none_ls.builtins.diagnostics.fish,
				none_ls.builtins.formatting.fish_indent,
				none_ls.builtins.formatting.prettierd,
				none_ls.builtins.formatting.stylua,
			},
		})

		require("mason-null-ls").setup({
			-- none-ls is source of truth, install what is setup through sources above
			automatic_installation = true,
			ensure_installed = nil,
		})
	end,
}
