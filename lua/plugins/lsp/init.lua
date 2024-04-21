local servers = require("./plugins/lsp/servers")
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
}
