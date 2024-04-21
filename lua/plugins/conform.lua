return {
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
}
