local servers = {
	cssls = {},
	html = {},
	volar = {
		init_options = {
			vue = {
				hybridMode = false,
			},
		},
	},
	tsserver = {
		settings = {
			implicitProjectConfiguration = {
				checkJs = true,
				allowJs = true,
			},
		},
	},
	jsonls = {},
	lua_ls = {
		settings = {
			Lua = {
				workspace = { checkThirdParty = false },
				telemetry = { enable = false },
				diagnostics = {
					globals = { "vim" },
				},
			},
		},
	},
}

local capabilities = vim.tbl_deep_extend(
	"force",
	{},
	vim.lsp.protocol.make_client_capabilities(),
	require("cmp_nvim_lsp").default_capabilities()
)

return {
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
		"williamboman/mason.nvim",
		opts = {},
		cmd = { "Mason" },
	},
	{
		"williamboman/mason-lspconfig.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			ensure_installed = vim.tbl_keys(servers),
			handlers = {
				function(server_name)
					local server = servers[server_name]
					if server == nil then
						return
					end
					local opts = vim.tbl_deep_extend("force", {
						capabilities = capabilities,
					}, type(server) == "function" and server() or server)
					require("lspconfig")[server_name].setup(opts)
				end,
			},
		},
	},
	{
		"stevearc/conform.nvim",
		keys = {
			{
				"<C-p>",
				function()
					local conform = require("conform")
					conform.format({
						lsp_fallback = false,
						async = false,
						timeout_ms = 500,
					})
				end,
				mode = { "n", "v" },
			},
		},
		opts = function()
			return {
				formatters = {
					prettierd = {
						env = {
							PRETTIERD_DEFAULT_CONFIG = vim.fn.expand("$HOME")
								.. "/.config/nvim/lua/plugins/lsp/.prettierrc",
						},
					},
				},
				formatters_by_ft = {
					javascript = { "prettierd" },
					typescript = { "prettierd" },
					vue = { "prettierd" },
					css = { "prettierd" },
					html = { "prettierd" },
					json = { "prettierd" },
					yaml = { "prettierd" },
					markdown = { "prettierd" },
					lua = { "stylua" },
				},
			}
		end,
	},
	{
		"mfussenegger/nvim-lint",
		config = function()
			local lint = require("lint")
			lint.linters_by_ft = {
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
				vue = { "eslint_d" },
			}
			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave", "TextChanged" }, {
				group = lint_augroup,
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},
	{
		"wavded/vim-stylus",
		ft = { "stylus" },
		opts = {},
	},
}
