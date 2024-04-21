return {
	"echasnovski/mini.files",
	cmd = { "MiniFiles" },
	keys = {
		{ "<leader>=", ":lua MiniFiles.open()<CR>", silent = true },
		{ "<leader>+", ":lua MiniFiles.open(vim.fn.expand('%:h'))<CR>", silent = true },
	},
	opts = {},
}
