local servers = {
	cssls = {},
	html = {},
	volar = {},
	jsonls = {},
	tsserver = {},
	lua_ls = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

return {
	{
		"wavded/vim-stylus",
		ft = { "stylus" },
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			ensure_installed = vim.tbl_keys(servers),
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
						settings = servers[server_name],
					})
				end,
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"nvim-lua/plenary.nvim",
		},
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = function()
			local nls = require("null-ls")
			return {
				sources = {
					nls.builtins.formatting.stylua,
					nls.builtins.code_actions.eslint_d,
					nls.builtins.diagnostics.eslint_d,
					nls.builtins.formatting.prettierd.with({
						env = {
							PRETTIERD_DEFAULT_CONFIG = vim.fn.expand("./.prettierrc"),
						},
					}),
				},
			}
		end,
	},
	{
		"williamboman/mason.nvim",
		opts = {},
	},
}
